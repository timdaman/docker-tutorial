FROM ruby:2.0.0

WORKDIR /usr/src/app

COPY todo-sample-app-master/Gemfile /usr/src/app/
COPY todo-sample-app-master/Gemfile.lock /usr/src/app/
RUN bundle install --without development test staging
