#!/bin/bash
## Required variables

export RACK_ENV=production
export SECRET_TOKEN=$(openssl rand -hex 20)

echo "clock: ruby schedule.rb" >> Procfile

bundle exec rake db:migrate
foreman start
