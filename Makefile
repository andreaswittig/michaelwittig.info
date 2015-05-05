default: run

build: feed
	@echo "build"
	@hugo --buildDrafts

deploy:
	@echo "deploy"
	@aws --profile widdix s3 sync public/ s3://michaelwittig.info/

feed:
	@echo "feed"
	@node feed/rss.js "https://medium.com/feed/@hellomichibye/" "data/articles_medium.json"
	@node feed/rss.js "http://blog.michaelwittig.info/rss/" "data/articles_blog.json"
	@curl "https://instagram.com/hellomichibye/media/" > "data/instagram.json"

run:
	@echo "run"
	@hugo server --buildDrafts -w
