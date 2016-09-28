var page = require('webpage').create();
var fs = require('fs');
var system = require('system');


var link = system.args[1];
var file = system.args[2] || "index.html";

page.open(link);

page.onLoadFinished = function() {
  console.log("page load finished");
  fs.write(file, page.content, 'w');
  phantom.exit();
};
