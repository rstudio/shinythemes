
// This must be executed with phantomjs
// Take a screenshot of a URL and saves it to a .png file

var system = require('system');
var args = system.args;

if (args.length === 1) {
  console.log('Usage:\n' +
    '  phantomjs screenshot.js <name>.png');
} else {
  var filename = args[1];
}

var page = require('webpage').create();

page.viewportSize = {
  width: 800,
  height: 500
};

page.open('http://localhost:9000/', function() {
  // Delay 200ms before taking screenshot
  window.setTimeout(function () {
    page.clipRect = { top: 0, left: 0, width: 800, height: 500 };
    page.render(filename);
    phantom.exit();
  }, 200);
});
