# Docker Jackett

This is a Dockerfile to set up Jackett.

## Build

To avoid permissions issues with shared volumes, use `--build-arg` to change the
uid:gid of the image at build time.

    docker build --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t jackett .

The docker run statement below creates a data volume named `jackett_config`.

## Run

<b>NOTE:</b> The port publishing (`-p 9117:9117`) needs to be done on the
openvpn container.

Systemd service file is also available. Make sure to use the --init flag for
cleaner and quicker container shutdowns.

    docker run -d \
               --mount type=volume,source=jackett_config,target=/config \
               -v /mnt/downloads:/data \
               --name jackett_run \
               --init \
               jackett
