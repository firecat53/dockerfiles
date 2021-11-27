# Deluge

Simple deluge container. Installs latest version available from pypi. Designed
to be run using the network stack from a VPN container.  Also contains p7zip and
unrar for the extractor plugin.

#### Defaults:

- Runs as user `deluge`. Default group `users`. Default password is `deluge`.
- Umask set to 002 (edit in start.sh if desired)
- Config directory: `/config/`. Data volume deluge_config created to store
  config data.
- Download volume: `/data/` (change Download path in web UI on first run)

## Build

To avoid permissions issues with shared volumes, use `--build-arg` to change the
uid:gid of the image at build time.

    docker build --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t deluge .

A bind-mounted volume can be used in place of the data volume for deluge_config.

## Run

<b>NOTE:</b> The port publishing (`-p 8112:8112`) needs to be done on the
VPN container.

Make sure to run with the `--init` flag to ensure container is properly
shutdown.

    docker run -d \
               --net=container:wireguard-client_run \
               --mount type=volume,source=deluge_config,target=/config \
               -v /mnt/downloads:/data \
               -v /etc/localtime:/etc/localtime:ro \
               --name deluge_run \
               --init \
               deluge
