# Qbittorrent

Compiles and installs latest stable (non-beta or RC tag) qBittorrent-nox without
the GUI components.  Designed to be run headless (Web UI only) using the network
stack from a VPN container.

#### Defaults:

- Runs as user `qbittorrent`. Default group `users`. Default password is `qbittorrent`.
- Umask set to 002 (edit in start.sh if desired)
- Config directory: `/config/`. Data volume qbittorrent_config created to store
  config data.
- Download volume: `/data/` (change Download path in web UI on first run)

## Build

### Requirements

libboost-dev and libtorrent-rasterbar-dev need to be available in the Alpine
repositories. If not, then compilation for them will need to be added to the
Dockerfile per the instructions [here][1].

To avoid permissions issues with shared volumes, use `--build-arg` to change the
uid:gid of the image at build time.

    docker build --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t qbittorrent .

A bind-mounted volume can be used in place of the data volume for qbittorrent_config.

## Run

<b>NOTE:</b> The port publishing (`-p 8080:8080`) needs to be done on the
VPN container.

To change the web UI port (default is 8080), use the `QBT_WEBUI_PORT=xxxx`
environment variable.

Make sure to run with the `--init` flag to ensure container is properly
shutdown.

    docker run -d \
               --env QBT_WEBUI_PORT=8081 \
               --net=container:wireguard-client_run \
               --mount type=volume,source=qbittorrent_config,target=/config \
               -v /mnt/downloads:/data \
               -v /etc/localtime:/etc/localtime:ro \
               --name qbittorrent_run \
               --init \
               qbittorrent
               
[1]: https://github.com/qbittorrent/qBittorrent/wiki/Compilation:-Alpine-Linux
