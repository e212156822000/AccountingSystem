FROM ruby:2.4.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /PolarisSystem
WORKDIR /PolarisSystem
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install
COPY . /PolarisSystem