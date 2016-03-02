#!/bin/bash

cd /usr/src/app

#TODO Move to env
RAILS_ENV=$ENVIRONMENT

rake db:migrate


rails server
