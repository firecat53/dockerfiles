# Docker Jackett

This is a Dockerfile to set up Jackett.

## Build

To avoid permissions issues with shared volumes, use `--build-arg` to change the
uid:gid of the image at build time.

    docker build --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t jackett .

If using data-only volumes for config and data:

    docker create -v /config --name jackett_config myscratch true
    docker run --volumes-from jackett_config --user root jackett chown -R jackett:users /config

## Run

<b>NOTE:</b> The port publishing (`-p 9117:9117`) needs to be done on the
openvpn container.

Systemd service file is also available. Make sure to use the --init flag for
cleaner and quicker container shutdowns.

    docker run -d \
               --volumes-from jackett_config \
               -v /mnt/downloads:/data \
               --name jackett_run \
               --init \
               jackett
