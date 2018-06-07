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

page.open('https://www.facebook.com', function(status) {
    if (status !== 'success') {
        console.log('Unable to access network');
    } else {

        var ua = page.evaluate(function() {
            var email = document.getElementsByName('email');
            email[0].value = 'khanhlinh290887@gmail.com';
            var pass = document.getElementsByName('pass');
            pass[0].value = 'mk12032908';
            var login = document.getElementsByName('login');
            login[0].click();
            return login[0].textContent;
        });
        console.log(ua);

        // do { phantom.page.sendEvent('mousemove'); } while (page.loading);

        var post = null;
        while (post === null || post === undefined){
            var str = '';
            var stream = fs.open('/var/www/html/tgs/fb.json', 'r');
            while(!stream.atEnd()) {
                var line = stream.readLine();
                str+=line;
            }
            stream.close();
            try{
                post = JSON.parse(str);
            } catch (e) {
                console.log(e);
            }
            console.log(post.url);
        }
        // page.render('/home/leon/Desktop/login1.png');

        if(post !== null && post !== undefined){
            page.open(post.url, function(status) {
                if (status !== 'success') {
                    console.log('Unable to access network');
                } else {
                    var k = 0;
                    var loop = setInterval(function(){
                        var buttons = page.evaluate(function() {
                            var pinnedUfi = document.getElementsByClassName('pinnedUfi');
                            if(pinnedUfi.length > 0){
                                var urlPageLink = pinnedUfi[0].getElementsByClassName('UFIPagerLink');
                                console.log('page link: '+urlPageLink.length);
                                if(urlPageLink.length > 0){
                                    var lastUrl = urlPageLink[urlPageLink.length - 1];
                                    lastUrl.click();
                                    return lastUrl.textContent === 'Xem thêm bình luận';
                                }
                                return urlPageLink.length;
                            }
                            return pinnedUfi.length;
                        });

                        k++;
                        console.log(buttons);
                        if (buttons < 1 && k > 100){
                            clearInterval(loop);
                            var content = page.content;
                            fs.write('/var/www/html/tgs/fb_comments_'+post.id+'.html', content, 'w');
                            console.log('Done');
                            phantom.exit();
                        }

                        // if (k === 50) clearInterval(loop); // 10 sec timeout
                    }, 200);
                }
            });
        }
    }
});