# Docker Syncthing Discovery Server

This is a Dockerfile to set up a self-hosted Syncthing global discovery server
using the latest git build.

## Build

First, complete one of the following three options:

1. If you need to generate cert.pem and key.pem, assuming you have a syncthing
container with the executable `syncthing`::

        ./initialize.sh

OR

2. If you have an existing key and certificate file, add those to the build
   directory as key.pem and cert.pem


        docker build -t syncthing_discovery .

## Run

Systemd service file available. You can add discosrv flags at the end of the docker run line.

    docker run -d -p 8443:8443 --name syncthing_discovery_run syncthing_discovery

or with arguments::

    docker run -d -p 8443:8443 --name syncthing_discovery_run syncthing_discovery -stats-intv=30

## Reverse Proxy Notes

If you are using an SSL certificate on the reverse proxy, run the discovery
server with the -http option. You also need to put the following two lines into
the appropriate place(s) in the nginx configuration file(s) to pass through the
client SSL certificates to discosrv::

    proxy_set_header X-SSL-Cert $ssl_client_cert;
    ssl_verify_client optional_no_ca;
