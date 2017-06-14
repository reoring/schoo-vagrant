#!/bin/bash

sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update

sudo apt-get update -qq && \
 apt-get install -y --no-install-recommends \
  ruby2.4 \
  ruby2.4-dev \
  build-essential \
  libpq-dev \
  libmysqlclient-dev \
  nodejs \
  sqlite3 \
  libsqlite3-dev \
  libfontconfig1 && \
  rm -rf /var/lib/apt/lists/*

sudo gem intall bundler
bundle config build.nokogiri --use-system-libraries
sudo gem install rails
