FROM ruby:2.4.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /RebuildPostgres
WORKDIR /RebuildPostgres
COPY Gemfile /RebuildPostgres/Gemfile
COPY Gemfile.lock /RebuildPostgres/Gemfile.lock
RUN bundle install
COPY . /RebuildPostgres