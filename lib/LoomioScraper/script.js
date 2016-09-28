 var page = require('webpage').create();
    var fs = require('fs');

    page.open("https://www.loomio.org/d/gEZ5NO1W", function() {
      page.evaluate(function() {
      });
    });

    page.onLoadFinished = function() {
        console.log("page load finished");

        fs.write('2.html', page.content, 'w');
	phantom.exit();
    };
