#!/bin/bash

# Ensure, that docker-compose stopped
docker compose stop

# Build new images
docker build . -t getting-started

# Start new deployment
heroku container:login
heroku container:push web --app mock-production-client
heroku container:release web --app mock-production-client