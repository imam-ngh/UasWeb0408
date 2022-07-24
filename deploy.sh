#!/bin/bash

echo "web: gunicorn server:project" > Procfile
git init
git add .
git commit -m "UAS Pemweb 0408 0450"

heroku create uas-pemweb-0408-0450
git push heroku master

heroku addons:create cleardb:ignite

dbURL=heroku config | grep CLEARDB_DATABASE_URL
heroku config:set DATABASE_URL=$dbURL

echo $dbURL
