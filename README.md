# michaelwittig.info

## Run example

First you need to [install Hugo](http://gohugo.io/overview/installing/).

Then execute the following command in the repository's folder

	hugo server --buildDrafts -w

Open http://localhost:1313/ to seethe page.

## Build example

To create all the static stuff that you need to upload the website to your favorite hosting company run

	hugo --buildDrafts

You will find a newly created `public` directory.

## Deploy

	aws --profile widdix s3 sync public/ s3://michaelwittig.info/
