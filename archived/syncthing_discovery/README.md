# Docker Syncthing Discovery Server

This is a Dockerfile to set up a self-hosted Syncthing global discovery server
using the latest git build.

## Build

First, complete one of the following three options:

1. If you need to generate cert.pem and key.pem, assuming you have a syncthing
container with the executable `syncthing`::

        ./initialize.sh

        docker build -t syncthing_discovery .

## Run

Systemd service file available. You can add discosrv flags at the end of the docker run line.

    docker run -d -p 8443:8443 --name syncthing_discovery_run syncthing_discovery -http

## Reverse Proxy Notes

If you are using an SSL certificate on the reverse proxy, run the discovery
server with the -http option. You also need to put the following three lines into
the appropriate place(s) in the nginx configuration file(s) to pass through the
client SSL certificates to discosrv::

    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-SSL-Cert $ssl_client_cert;
    ssl_verify_client optional_no_ca;

As of 5/2018, I'm unable to figure out a way to run the discovery server behind
any other proxy (Traefik, Caddy, etc.).
