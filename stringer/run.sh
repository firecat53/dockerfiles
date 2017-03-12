#!/bin/bash
## Required variables

export RACK_ENV=production
export SECRET_TOKEN=$(openssl rand -hex 20)
export TZ='America/Los_Angeles'

echo "clock: ruby schedule.rb" >> Procfile

bundle exec rake db:migrate
foreman start
