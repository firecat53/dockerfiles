Docker Plex
===========

This is a Dockerfile to set up (https://plex.tv/ "Plex Media Server") - (https://plex.tv/)

Build
-----

Build from docker file::

	docker build -rm -t plex . 

Create data-only volumes::

    docker run -v /data --name plex_data busybox /bin/true
    docker run -v /config --name plex_config busybox /bin/true

Run
___

Running the container (without LXC networking fix)::

	docker run -d -h <plex_host_name> --volumes-from sabnzbd_data --volumes-from plex_config -p 32400:32400 --name plex_run plex

Discovery by the Roku app doesn't work unless run on a separate bridged IP on the same network as the Roku (at least as far as I can tell). The IP must have the CIDR. Use pipework to create the appropriate network. Note: br0 is existing network bridge on my system::

    # pipework br0 <plex container ID> 192.168.0.240/24

Manage
------

To manage downloaded media (access the sanbnzbd_data volume)::

    # docker run -i -t --volumes-from sabnzbd_data ubuntu /bin/bash
