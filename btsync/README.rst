Docker Btsync
=============

This is a Dockerfile to set up Bittorrent Sync. Add a customized btsync.conf if desired and uncomment the ``ADD btsync.conf`` line. Make sure the listening port in btsync.conf matches the <PORT> value when running the container. If you don't want to use the web interface, you can remove port 8888 from the ``docker run`` statement.

We'll assume that the data directories to by sync'd will all live under one directory that can be mounted via ``-v <host_dir>:/data``. The config/logging directory will live in a data-only volume.

A static IP will be assigned via the pipework script so that Upnp/NAT port forwarding can be used with the router. If a static port is forwarded and assigned in btsync.conf, then this may not be necessary.

Build
-----

Add your own btsync.conf into the private/ directory or::

    # btsync --dump-sample-config > private/btsync.conf

Then::

    # docker build -t btsync .

Create config volume::

    # docker run -v /config --name btsync_config busybox /bin/true

Run
---

If pipework/bridged network is used, then the ports don't need to be exposed. Otherwise use the ``-p`` directives as necessary.

::

    # docker run -d -v /mnt/btsync:/data --volumes-from btsync_config -p 8888:8888 -p <PORT>:<PORT> --name btsync_run btsync
    # pipework br0 docker_run 192.168.0.242/24@192.168.0.1
