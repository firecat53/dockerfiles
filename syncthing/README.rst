Docker Syncthing
================

This is a Dockerfile to set up Syncthing.

Mount any desired directories to sync using ``-v <host_dir>:<host_dir>`` when running the container. The config/logging directory will live in a data-only volume (/config). We have to run Syncthing using supervisord to allow Syncthing to restart itself without killing off the container.

Build
-----

Create config volume::

    # docker run -v /config --name syncthing_config busybox /bin/true

Update Syncthing version to latest values in the Dockerfile, then::

    # docker build --rm -t syncthing .

Run Syncthing once inside the container to generate the configuration files::

    # docker run --rm -it --volumes-from syncthing_config syncthing /bin/bash
    root@851f9e42ac1c:/# ./syncthing -home /config
    root@851f9e42ac1c:/# vi /config/config.xml

Edit /config/config.xml to change::

    <address>127.0.0.1:8080</address>

to::

    <address>:8080</address>

Run
---

Systemd service file available.

::

    # docker run -d -v /mnt/media:/mnt/media --volumes-from syncthing_config -p 22000:22000 -p 8080:8080 --name syncthing_run syncthing
