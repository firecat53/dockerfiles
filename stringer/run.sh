#!/bin/bash
## Required variables

if [ -z $STRINGER_DATABASE_USERNAME ]; then
    echo "STRINGER_DATABASE_USERNAME must be set"
    exit 1
fi
if [ -z $STRINGER_DATABASE_PASSWORD ]; then
    echo "STRINGER_DATABASE_PASSWORD must be set"
    exit 1
fi

## Defaults below
#
export STRINGER_DATABASE_HOST=$POSTGRES_PORT_5432_TCP_ADDR
export STRINGER_DATABASE_PORT=$POSTGRES_PORT_5432_TCP_PORT
export RACK_ENV=production
export SECRET_TOKEN=$(openssl rand -hex 20)

echo "clock: ruby schedule.rb" >> Procfile

bundle exec rake db:migrate
foreman start
