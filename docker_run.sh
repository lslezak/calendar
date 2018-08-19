#! /bin/bash

# make sure we are always at the root dir
cd "${BASH_SOURCE%/*}"

# start the project
docker-compose up
