# Docker Sickrage

This is a Dockerfile to set up Sickrage.

## Build

    docker build -t sickrage .

## Run

Systemd service file is also available.

    docker run -d \
               --mount type=volume,source=sickrage_config,target=/config \
               -p 8081:8081 \
               --name sickrage_run \
               --init \
               sickrage
