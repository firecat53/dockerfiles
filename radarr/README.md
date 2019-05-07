# Docker Radarr

This is a Dockerfile to set up Radarr based on the latest Github release.
Configuration stored in a data volume named `radarr_config`.

## Build

To avoid permissions issues with shared volumes, use `--build-arg` to change the
uid:gid of the image at build time.

    docker build --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t radarr .

## Run

Systemd service file is also available.

    docker run -d \
               --init \
               --mount type=volume,source=radarr_config,target=/config \
               -v /mnt/downloads:/data \
               -p 7878:7878 \
               --name radarr_run \
               radarr
