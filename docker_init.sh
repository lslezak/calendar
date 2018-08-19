#! /bin/bash

# make sure we are always at the root dir
cd "${BASH_SOURCE%/*}"

# build the Docker images
docker-compose build

docker-compose start
docker-compose run -e PSQLOPTS="--host postgres -U postgres " davical /usr/share/davical/dba/create-database.sh davical admin_password
docker-compose exec postgres createuser davical_app
docker-compose exec postgres createuser davical_dba
docker-compose down

