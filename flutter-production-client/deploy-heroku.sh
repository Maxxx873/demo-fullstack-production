#!/bin/bash

heroku login
git init
heroku git:remote -a demo-production-client
heroku buildpacks:set diezep/flutter -a demo-production-client
git add .
git commit -am "first deployment"
git push heroku main