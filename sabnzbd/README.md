# Docker Sabnzbd

This is a Dockerfile to set up Sabnzbd from the jcfp PPA. Change port if
necessary to accommodate SSL.

## Build

The default UID:GID in the container is 1000:100. If your user has a different
uid:gid, pass `--build-arg` so the uid:gid of your user matches the sabnzbd user
in the container.

    docker build --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t sabnzbd .

Create data-only volume for config:

    docker create -v /config --name sabnzbd_config myscratch true
    docker run --volumes-from sabnzbd_config --user root sabnzbd chown -R sabnzbd:users /config

## Run

    docker run -d --volumes-from sabnzbd_config -v /mnt/downloads:/data -p 8080:8080 --name sabnzbd_run sabnzbd

If you enable SSL, make sure to change your port numbers when running the
container (9090 typically). Systemd service file is available.
