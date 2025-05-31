# Docker Sabnzbd

This is a Dockerfile to set up Sabnzbd from the jcfp PPA. Change port if
necessary to accommodate SSL. A data only volume is created to store the
configuration data named `sabnzbd_config`.

## Build

The default UID:GID in the container is 1000:100. If your user has a different
uid:gid, pass `--build-arg` so the uid:gid of your user matches the sabnzbd user
in the container.

    docker build --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t sabnzbd .

## Run

    docker run -d \
           --mount type=volume,source=sabnzbd_config,target=/config \
           -v /mnt/downloads:/data \
           -p 8080:8080 \
           --name sabnzbd_run \
           sabnzbd

If you enable SSL, make sure to change your port numbers when running the
container (9090 typically). Systemd service file is available.
