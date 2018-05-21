# Docker Sabnzbd

This is a Dockerfile to set up Sabnzbd from the jcfp PPA. Change port if
necessary to accommodate SSL. You can use this with Docker data volumes if you
desire for storing configuration and downloads.

## Build

The default UID:GID in the container is 1000:100. If your user has a different
uid:gid, pass `--build-arg` so the uid:gid of your user matches the sabnzbd user
in the container.

    docker build --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t sabnzbd .

If using data-only volumes for config and data:

    docker create -v /config --name sabnzbd_config myscratch true
    docker run --volumes-from sabnzbd_config --user root sabnzbd chown -R sabnzbd:users /config

    docker run -v /data --name media_data myscratch true
    docker run --volumes-from media_data --user root sabnzbd chown -R sabnzbd:users /data

## Run

For regular filesystem storage::

    docker run -d -v <path/to/config-file>:/config -v <path/to/downloads>:/data -p 8080:8080 sabnzbd

For data-only volume storage::

    docker run -d --volumes-from sabnzbd_config --volumes-from media_data -p 8080:8080 --name sabnzbd_run sabnzbd

If you enable SSL, make sure to change your port numbers when running the
container (9090 typically). Systemd service file is available.

## Manage

To manage downloaded media if stored in a data-only volume:

    docker run -it --rm --volumes-from media_data ubuntu bash
