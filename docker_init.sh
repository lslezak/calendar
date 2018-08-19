#! /bin/bash

# make sure we are always at the root dir
cd "${BASH_SOURCE%/*}"

set -e -x

# build the Docker images
docker-compose build
docker-compose up --no-start
docker-compose start

docker-compose run -e PSQLOPTS="--host postgres -U postgres " davical /usr/share/davical/dba/create-database.sh davical admin_password

