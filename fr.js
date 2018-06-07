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

var post = null;
while (post === null || post === undefined){
    var str = '';
    var stream = fs.open('/var/www/html/tgs/fr.json', 'r');
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

if(post !== null && post !== undefined) {
    page.open(post.url, function (status) {
        if (status !== 'success') {
            console.log('Unable to access network');
        } else {
            var k = 0;
            var loop = setInterval(function () {
                var buttons = page.evaluate(function () {
                    var buttons = document.getElementsByTagName('button');
                    for (var i = 0; i < buttons.length; i++) {
                        var button = buttons[i];
                        if (button.textContent.indexOf('Load') >= 0) {
                            button.click();
                        }
                    }
                    return buttons.length;
                });

                k++;
                console.log(buttons);
                if (buttons < 1 && k > 100) {
                    clearInterval(loop);
                    var content = page.content;
                    fs.write('/var/www/html/tgs/forum_plugin_'+post.id+'.html', content, 'w');
                    console.log('Done');
                    phantom.exit();
                }

                // if (k === 50) clearInterval(loop); // 10 sec timeout
            }, 200);
        }
    });
}