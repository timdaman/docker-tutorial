FROM ruby:2.0.0

WORKDIR /usr/src/app

COPY todo-sample-app-master/Gemfile /usr/src/app/
COPY todo-sample-app-master/Gemfile.lock /usr/src/app/
RUN bundle install --without development test staging

COPY todo-sample-app-master /usr/src/app
COPY database.yml /usr/src/app/config/
COPY entrypoint.sh /
CMD bash /entrypoint.sh
