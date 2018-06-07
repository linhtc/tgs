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

var posts = null;
var str = '';
var stream = fs.open('/var/www/html/tgs/fb.json', 'r');
while(!stream.atEnd()) {
    var line = stream.readLine();
    str+=line;
}
stream.close();
try{
    posts = JSON.parse(str);
} catch (e) {
    console.log(e);
}
if(posts !== null && posts !== undefined){
    for(var key in posts){
        if(posts.hasOwnProperty(key)){
            var post = posts[key];
            console.log(post.url);
        }
    }
}

phantom.exit();

page.open('https://www.facebook.com', function(status) {
    if (status !== 'success') {
        console.log('Unable to access network');
    } else {
        // console.log('Content: ' + content);
        // page.render('/home/leon/Desktop/step1.png');

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

        do { phantom.page.sendEvent('mousemove'); } while (page.loading);
        // page.render('/home/leon/Desktop/step2.png');

        // var content = page.content;
        // fs.write('/var/www/html/tgs/fb_login.html', content, 'w');

        page.open('https://www.facebook.com/mobiistar/photos/a.162205107192.139328.158725017192/10156533490832193/?type=3&theater', function(status) {
            if (status !== 'success') {
                console.log('Unable to access network');
            } else {
                do { phantom.page.sendEvent('mousemove'); }
                while (page.evaluate(function() {
                    var pinnedUfi = document.getElementsByClassName('pinnedUfi');
                    console.log('comment class: '+pinnedUfi.length);
                    if(pinnedUfi.length > 0){
                        var urlPageLink = pinnedUfi[0].getElementsByClassName('UFIPagerLink');
                        console.log('page link: '+urlPageLink.length);
                        if(urlPageLink.length > 0){
                            var lastUrl = urlPageLink[urlPageLink.length - 1];
                            lastUrl.click();
                            return lastUrl.textContent === 'Xem thêm bình luận';
                        }
                    }
                    return true;
                }));

                do { phantom.page.sendEvent('mousemove'); } while (page.loading);
                var content = page.content;
                fs.write('/var/www/html/tgs/fb_comments.html', content, 'w');
                // page.render('/home/leon/Desktop/step2.png');

                phantom.exit();
            }
            // phantom.exit();
        });

        // phantom.exit();
    }
    // phantom.exit();
});