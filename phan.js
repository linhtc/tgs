var page = require('webpage').create();
var fs = require('fs');
// console.log('The default user agent is ' + page.settings.userAgent);
// page.settings.userAgent = 'SpecialAgent';

page.onResourceReceived = function(response) {
    if (response.stage !== "end") return;
    console.log('Response (#' + response.id + ', stage "' + response.stage + '"): ' + response.url);
};
page.onResourceRequested = function(requestData, networkRequest) {
    console.log('Request (#' + requestData.id + '): ' + requestData.url);
};
page.onUrlChanged = function(targetUrl) {
    console.log('New URL: ' + targetUrl);
};
page.onLoadFinished = function(status) {
    console.log('Load Finished: ' + status);
};
page.onLoadStarted = function() {
    console.log('Load Started');
};
page.onNavigationRequested = function(url, type, willNavigate, main) {
    console.log('Trying to navigate to: ' + url);
};

page.open('https://www.facebook.com/mobiistar/posts/10156533490862193', function(status) {
    if (status !== 'success') {
        console.log('Unable to access network');
    } else {
        // var content = page.content;
        // fs.write('/var/www/html/tgs/page.html', content, 'w');
        // console.log('Content: ' + content);
        page.render('/home/leon/Desktop/step1.png');

        var ua = page.evaluate(function() {
            // return document;
            var anchors = document.getElementById('u_0_q').getElementsByTagName("a");
            anchors[0].click();
            return anchors[0].textContent;
            // return comments.textContent; UFIComment
        });
        console.log(ua);

        do { phantom.page.sendEvent('mousemove'); } while (page.loading);
        page.render('/home/leon/Desktop/step2.png');

        do { phantom.page.sendEvent('mousemove'); }
        while (page.evaluate(function() {return document.getElementsByClassName('UFIComment').length <=0;}));

        var ua2 = page.evaluate(function() {
            var urlPageLink = document.getElementsByClassName('UFIPagerLink');
            console.log(urlPageLink.length);
            if(urlPageLink.length > 0){
                var lastUrl = urlPageLink[urlPageLink.length - 1];
                lastUrl.click();
                return lastUrl.textContent;
            }
        });
        console.log(ua2);
        do { phantom.page.sendEvent('mousemove'); }
        while (page.evaluate(function() {
            var urlPageLink = document.getElementsByClassName('UFIPagerLink');
            console.log(urlPageLink.length);
            if(urlPageLink.length > 0){
                var lastUrl = urlPageLink[urlPageLink.length - 1];
                lastUrl.click();
                return lastUrl.textContent === 'Xem thêm bình luận';
            }
            return true;
        }));


        var content = page.content;
        fs.write('/var/www/html/tgs/page.html', content, 'w');
        do { phantom.page.sendEvent('mousemove'); } while (page.loading);
        page.render('/home/leon/Desktop/step3.png');

        phantom.exit();
    }
    // phantom.exit();
});