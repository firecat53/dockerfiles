# Docker Sonarr

This is a Dockerfile to set up Sonarr from their PPA.

## Build

    docker build -t sonarr .

If using data-only volumes for config and data:

    docker create -v /config --name sonarr_config myscratch true
    docker run --volumes-from sonarr_config --user root sonarr chown -R sonarr:users /config

## Run

Systemd service file is also available.

    docker run -d --volumes-from sonarr_config -p 8989:8989 --name sonarr_run sonarr
