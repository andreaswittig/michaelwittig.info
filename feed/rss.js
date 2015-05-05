// usage node rss.js "https://medium.com/feed/@hellomichibye/" "./medium.rss"

var fs = require("fs");
var rss = require("parse-rss");

rss(process.argv[2], function(err, rss) {
	"use strict";
	if (err) {
		console.error("error", err);
		process.exit(1);
	} else {
		var json = JSON.stringify(rss);
		fs.writeFile(process.argv[3], json, {"encoding": "utf8"}, function(err) {
			if (err) {
				console.error("error", err);
				process.exit(2);
			} else {
				process.exit(0);
			}
		});
	}
});
