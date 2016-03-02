#!/bin/bash

cd /usr/src/app

RAILS_ENV=$ENVIRONMENT

rake db:migrate

exec rails server
