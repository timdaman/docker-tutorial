FROM ruby:2.0.0

WORKDIR /usr/src/app

COPY todo-sample-app/Gemfile /usr/src/app/
COPY todo-sample-app/Gemfile.lock /usr/src/app/
RUN bundle install --without development test staging

ENV ENVIRONMENT=production
