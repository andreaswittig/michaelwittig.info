default: run

run:
	@echo "run"
	@hugo server --buildDrafts -w

getfeed:
	@echo "getfeed"
	@node feed/rss.js "https://medium.com/feed/@hellomichibye/" "data/articles_medium.json"
	@node feed/rss.js "http://blog.michaelwittig.info/rss/" "data/articles_blog.json"
	@node feed/rss.js "http://cloudonauten.de/rss/" "data/articles_cloudonauten.json"
	@curl "https://instagram.com/hellomichibye/media/" > "data/instagram.json"

build:
	@echo "build"
	@rm -rf public/
	@hugo --buildDrafts

publish:
	@echo "publish"
	@aws s3 sync public/ s3://michaelwittig.info/

deploy: getfeed build publish
	@echo "deploy"
