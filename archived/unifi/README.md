# Unifi-controller

https://help.ui.com/hc/en-us/articles/220066768-UniFi-How-to-Install-and-Update-via-APT-on-Debian-or-Ubuntu

This Dockerfile builds an image to run the latest _stable_ Unifi Controller
software.

Logs and configuration are stored in a Docker volume `unifi_config`.

## Build

    docker build -t unifi .

## Run

Systemd service file available. Enable 'host' networking if desired to simplify
port configuration or if there is trouble discovering AP's.

    docker run -d \
               --init \
               --mount type=volume,source=unifi_config,target=/config \
               -p 3478:3478/udp \   # STUN
               -p 6789:6789 \       # Unifi mobile speed test
               -p 8080:8080 \       # Device & controller communication
               -p 8443:8443 \       # Controller Web GUI
               -p 8843:8843 \       # HTTPS portal redirection
               -p 8880:8880 \       # HTTP portal redirection
               -p 10001:10001/udp \ # Device discovery
               --name unifi_run \
               unifi

For additional ports see https://help.ubnt.com/hc/en-us/articles/218506997-UniFi-Ports-Used.

## Using with Traefik as a reverse proxy

Since the Unifi software responds only on https by default, Traefik labels need
to be applied to handle https.

1. Add `insecureSkipVerify = true` to traefik.toml. *Make sure the security implications of this are clear for your setup!*
2. Add the following labels to the unifi.service file (in addition to whatever
   normal traefik labels are needed:

        -l traefik.http.routers.unifi-run.middlewares=headers \
        -l traefik.http.middlewares.headers.headers.browserxssfilter=true \
        -l traefik.http.middlewares.headers.headers.contenttypenosniff=true  \
        -l traefik.http.middlewares.headers.headers.forcestsheader=true \
        -l traefik.http.middlewares.headers.headers.framedeny=true \
        -l traefik.http.middlewares.headers.headers.sslhost=firecat53.net \
        -l traefik.http.middlewares.headers.headers.sslredirect=true \
        -l traefik.http.middlewares.headers.headers.stsincludesubdomains=true \
        -l traefik.http.middlewares.headers.headers.stspreload=true \
        -l traefik.http.middlewares.headers.headers.stsseconds=315360000 \
        -l traefik.http.services.unifi-run.loadbalancer.server.scheme=https \
        -l traefik.http.services.unifi-run.loadbalancer.passhostheader=true \
