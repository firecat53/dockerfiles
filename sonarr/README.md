# Docker Sonarr

This is a Dockerfile to set up Sonarr from their PPA. Configuration stored in a
data volume named `sonarr_config`.

## Build

To avoid permissions issues with shared volumes, use `--build-arg` to change the
uid:gid of the image at build time.

    docker build --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t sonarr .

## Run

Systemd service file is also available.

    docker run -d \
               --mount type=volume,source=sonarr_config,target=/config \
               -v /mnt/downloads:/data \
               -p 8989:8989 \
               --name sonarr_run \
               sonarr
