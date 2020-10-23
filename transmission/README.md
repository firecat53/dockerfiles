# Transmission

Simple transmission container. Designed to be run using the network stack from
a VPN container.

#### Defaults:

- Run as user `transmission`. Default group `users`
- RPC username:password `transmission:transmission`
- Config directory: `/config`
- Download directory: `/data/transmission`
- Incomplete directory: `/data/incomplete`
- Watch directory: `/data/watch`
- Umask: 2

## Build

To avoid permissions issues with shared volumes, use `--build-arg` to change the
uid:gid of the image at build time.

    docker build --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t transmission .

A bind-mounted volume can be used in place of the data-only volume for
transmission_config.

## Run

<b>NOTE:</b> The port publishing (`-p 9091:9091`) needs to be done on the
VPN container unless a reverse proxy will be used to connect to the web UI.

    docker run -d \
               --net=container:wireguard-client_run \
               --mount type=volume,source=transmission_config,target=/config \
               -v /mnt/downloads:/data \
               -v /etc/localtime:/etc/localtime:ro \
               --name transmission_run \
               transmission
