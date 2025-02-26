#!/usr/bin/env bash
set -o errexit

bundle install
RAILS_ENV=production bundle exec rails assets:precompile
RAILS_ENV=production bundle exec rails assets:clean

# Rebuild the database on deploy (acceptable since you're using fake data)
RAILS_ENV=production bundle exec rails db:drop
RAILS_ENV=production bundle exec rails db:create
RAILS_ENV=production bundle exec rails db:migrate
RAILS_ENV=production bundle exec rails db:seed
