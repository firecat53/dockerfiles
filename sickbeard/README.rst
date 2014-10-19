Docker CouchPotato
==================

This is a Dockerfile to set up Sickbeard. It creates volume mount point at /data (location for your downloads and config file).

Build
-----

::

    # docker build -t sickbeard .

Create data volume and set permissions::

    # docker run -v /data --name sickbeard_data scratch true &> /dev/null
    # docker run -it --rm --volumes-from sickbeard_data ubuntu /bin/bash
    root@xxxxx # chown -R 22000 /data

Run
---

Systemd service file is also available.  ::

    # docker run -d --volumes-from sickbeard_data -p 8081:8081 --name sickbeard sickbeard
