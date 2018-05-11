# Docker CouchPotato

This is a Dockerfile to set up CouchPotato. It creates volume mount point at
/config (location for your downloads and config file).

## Build

    docker build -t couchpotato .

Create data-only volume and set permissions::

    docker create -v /config --name couchpotato_config myscratch true
    docker run --rm --volumes-from couchpotato_config --user root couchpotato chown -R couchpotato:users /config

## Run

Systemd service file available.

    docker run -d \
               --volumes-from couchpotato_config \
               -p 5050:5050 \
               --name couchpotato_run \
               couchpotato
