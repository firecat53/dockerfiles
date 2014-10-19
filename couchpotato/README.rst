Docker CouchPotato
==================

This is a Dockerfile to set up CouchPotato. It creates volume mount point at /data (location for your downloads and config file).

Build
-----

::

    # docker build -t couchpotato .

Create data volume and set permissions::

    # docker run -v /data --name couchpotato_data scratch true &> /dev/null
    # docker run -it --rm --volumes-from couchpotato_data ubuntu /bin/bash
    root@xxxxx # chown -R 22000 /data

Run
---

Systemd service file available.

::

    # docker run -d --volumes-from couchpotato_data -p 5050:5050 --name couchpotato couchpotato
