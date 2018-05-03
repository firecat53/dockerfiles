# Transmission

Simple transmission container. Designed to be run using the network stack from
an OpenVPN container.

#### Defaults:

- Run as user `transmission`. Default group `users`
- RPC username:password `transmission:transmission`
- Config directory: `/config`
- Download directory: `/data/transmission`
- Incomplete directory: `/data/incomplete`
- Watch directory: `/data/watch`
- Umask: 2

## Build

    docker build -t transmission .
    docker create -v /config --name transmission_config myscratch true
    docker run --rm --volumes-from transmission_config --user root transmission chown -R transmission:users /config

A bind-mounted volume can be used in place of the data-only volume for
transmission_config.

Make sure the downloads directory has `g+w` set and is part of the `users` group.

## Run

<b>NOTE:</b> The port publishing (`-p 9091:9091`) needs to be done on the
openvpn container unless a reverse proxy will be used to conenct to the web UI.

    docker run -d \
               --net=container:openvpn_run \
               --volumes-from transmission_config \
               -v pia_port:/var/run/pia \
               -v /media/downloads:/data \
               -v /etc/localtime:/etc/localtime:ro \
               --name transmission_run \
               transmission
