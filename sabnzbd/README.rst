Docker Sabnzbd
==============

This is a Dockerfile to set up Sabnzbd from the jcfp PPA. It creates volume mount points at /config (for saving configuration files) and /data (location for your downloads). Change port if necessary to accomadate SSL. You can use this with Docker data volumes if you desire for storing configuration and downloads.

Build
-----

::

    # docker build -t sabnzbd .

If using data-only volumes is desired::

    # docker run -v /config --name sabnzbd_config scratch true &> /dev/null
    # docker run -v /data --name media_data scratch true &> /dev/null
    # docker run -it --rm --volumes-from media_data --volumes-from sabnzbd_config ubuntu /bin/bash
    root@xxxxx # chown -R 22000 /config
    root@xxxxx # chown -R 22000 /data

Run
---

For regular filesystem storage::

    # docker run -d -v <path/to/config-file>:/config -v <path/to/downloads>:/data -p 8080:8080 sabnzbd

For data-only volume storage::

    # docker run -d --volumes-from sabnzbd_config --volumes-from media_data -p 8080:8080 --name sabnzbd sabnzbd

If you enable SSL, make sure to change your port numbers when running the container (9090 typically). Systemd service file is available.

Manage
------

To manage downloaded media (access the media_data volume)::

    # docker run -i -t --volumes-from media_data ubuntu /bin/bash
