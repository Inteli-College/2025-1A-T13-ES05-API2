#!/usr/bin/env bash
set -o errexit

bundle install

# Rebuild the database on deploy (acceptable since you're using fake data)
RAILS_ENV=production bundle exec rails db:migrate
RAILS_ENV=production bundle exec rails db:seed
