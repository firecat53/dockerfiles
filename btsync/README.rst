Docker Btsync
=============

This is a Dockerfile to set up Bittorrent Sync.

We'll assume that the data directories to by sync'd will all live under one
directory that can be mounted via ``-v <host_dir>:/data``. The config/logging
directory will live in a data-only volume.

Note: UPnP doesn't work...NAP-PMP must be enabled on the router, or forward the ports manually.

Build
-----

Create config volume and set permissions (remember to set permissions on any bind-mounted volumes as well)::

    # docker run -v /home/btsync/.sync --name btsync_config ubuntu chown -R 22000 /home/btsync/.sync

Change the webui listening port in the Dockerfile if necessary (default is 8888), then::

    # docker build -t btsync .

Run
---

Systemd service file available.

::

    # docker run -d -v /mnt/media:/mnt/media --volumes-from btsync_config -p 30000:30000 -p 8888:8888 --name btsync_run btsync
