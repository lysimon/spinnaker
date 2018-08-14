#!/bin/bash

# On any failure, fail hard
set -ex

# Copy env file
cp compose.env .env

# Copying configuration to spinnaker-local
cp ../../config/default-spinnaker-local.yml ../../config/spinnaker-local.yml

# Rerun reconfigure_spinnaker.sh
#../.././pylib/spinnaker/reconfigure_spinnaker.py
# Right now, we have to build a container for it, this is really ugly

# Make sure everything is download
docker-compose stop
# Pull all the images in parallel
docker-compose pull
# Starting the full environment, or, if parameter given, only with those
docker-compose up --build deck gate echo rosco igor front50 orca clouddriver
#docker-compose up --build echo
