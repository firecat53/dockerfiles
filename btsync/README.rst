Docker Btsync
=============

This is a Dockerfile to set up Bittorrent Sync. If you want a custom btsync.conf, add it to the root directory before building and edit the Dockerfile and start.sh. Otherwise, just edit the values from the webui.

We'll assume that the data directories to by sync'd will all live under one directory that can be mounted via ``-v <host_dir>:/data``. The config/logging directory will live in a data-only volume.

A static IP will be assigned via the pipework script so that Upnp/NAT port forwarding can be used with the router. If a static port is forwarded and assigned in btsync.conf, then this may not be necessary. Note: UPnP doesn't work...NAP-PMP must be enabled on the router.

Build
-----

Create config volume::

    # docker run -v /.sync --name btsync_config busybox /bin/true

Then::

    # docker build -t btsync .

Run
---

If pipework/bridged network is used, then the ports don't need to be exposed. Otherwise use the ``-p`` directives as necessary.

::

    # docker run -d --networking=False -v /mnt/btsync:/data --volumes-from btsync_config --name btsync_run btsync
    # pipework br0 docker_run 192.168.0.242/24@192.168.0.1
