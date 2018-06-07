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

page.open('https://www.facebook.com/plugins/feedback.php?api_key=472186849643124&channel_url=http%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2FEIL5DcDc3Zh.js%3Fversion%3D42%23cb%3Df25098e9f925a6c%26domain%3Dhotro.mobiistar.vn%26origin%3Dhttp%253A%252F%252Fhotro.mobiistar.vn%252Ff19f5ac7d7303d%26relation%3Dparent.parent&href=http%3A%2F%2Fhotro.mobiistar.vn%2Fthreads%2Fxem-video-trung-lai-zumbo.44217%2F&locale=en_US&numposts=10&sdk=joey&version=v2.6&width=650', function(status) {
    if (status !== 'success') {
        console.log('Unable to access network');
    } else {
        var k = 0;
        var loop = setInterval(function(){
            var buttons = page.evaluate(function() {
                var buttons = document.getElementsByTagName('button');
                for(var i=0; i<buttons.length; i++){
                    var button = buttons[i];
                    if(button.textContent.indexOf('Load') >= 0){
                        button.click();
                    }
                }
                return buttons.length;
            });

            k++;
            console.log(buttons);
            if (buttons < 1 && k > 100){
                clearInterval(loop);
                var content = page.content;
                fs.write('/var/www/html/tgs/forum_plugin.html', content, 'w');
                console.log('Done');
                phantom.exit();
            }

            // if (k === 50) clearInterval(loop); // 10 sec timeout
        }, 200);

        // phantom.exit();
    }
    // phantom.exit();
});