FROM ruby:2.4.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /AccountingSystem
WORKDIR /AccountingSystem
COPY Gemfile /AccountingSystem/Gemfile
COPY Gemfile.lock /AccountingSystem/Gemfile.lock
RUN bundle install
COPY . /AccountingSystem