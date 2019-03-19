# Docker CouchPotato

This is a Dockerfile to set up CouchPotato. Running the container creates a
volume that is mounted to /config for configuration files.

## Build

    docker build -t couchpotato .

## Run

Systemd service file available.

    docker run -d \
               --mount type=volume,source=couchpotato_config,target=/config \
               -p 5050:5050 \
               --name couchpotato_run \
               couchpotato
