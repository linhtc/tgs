const cheerio = require('cheerio');

var fs = require('fs');
var path = require('path');
var filePath = path.join(__dirname, 'fb_comments_1.html');

fs.readFile(filePath, {encoding: 'utf-8'}, function(err, data){
    if (!err) {
        console.log(data);
        const $ = cheerio.load(data);
        $.html();
    } else {
        console.log(err);
    }
});