#!/bin/sh

# Exit if miniflux_data already exists
[ "$(docker volume ls -qf name=miniflux_data)" ] && exit 0

# Create data volume and miniflux network
docker volume create miniflux_data
docker network create miniflux

## Initialize database
echo "Initializing database...20 second wait"
docker run --rm \
           -d \
           --user postgres:postgres \
           --name postgres_run \
           --network miniflux \
           -v miniflux_data:/var/lib/postgresql/data \
           -e POSTGRES_USER=miniflux \
           -e POSTGRES_PASSWORD=miniflux \
           postgres:alpine

## Run database migration and create initial admin user
sleep 20
echo "Running migrations"
docker run --rm \
           -d \
           --name miniflux_run \
           --network miniflux \
           -e DATABASE_URL="user=miniflux password=miniflux dbname=miniflux sslmode=disable host=postgres_run" \
           -e RUN_MIGRATIONS=1 \
           -e CREATE_ADMIN=1 \
           -e ADMIN_USERNAME=miniflux \
           -e ADMIN_PASSWORD=miniflux \
           miniflux

## Stop containers
sleep 5
echo "Stopping containers"
docker stop miniflux_run postgres_run
