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

page.open('http://hotro.mobiistar.vn/threads/lo-dien-hinh-anh-cua-san-pham-moi-chuan-bi-ra-mat-cua-mobiistar.48977/', function(status) {
    if (status !== 'success') {
        console.log('Unable to access network');
    } else {
        do { phantom.page.sendEvent('mousemove'); }
        while (page.evaluate(function() {return document.getElementsByClassName('fb_ltr').length <= 0;}));

        var content = page.content;
        fs.write('/var/www/html/tgs/forum.html', content, 'w');

        phantom.exit();
    }
    // phantom.exit();
});