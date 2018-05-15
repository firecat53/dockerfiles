# Docker Sickrage

This is a Dockerfile to set up Sickrage.

## Build

    docker build -t sickrage .

Create data volume and set permissions:

    docker create -v /config --name sickrage_config myscratch true
    docker run --rm --volumes-from sickrage_config --user root sickrage chown -R sickrage:sickrage /config

## Run

Systemd service file is also available.

    docker run -d --volumes-from sickrage_config -p 8081:8081 --name sickrage_run sickrage
