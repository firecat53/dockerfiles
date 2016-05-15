Docker CouchPotato
==================

This is a Dockerfile to set up Sickbeard.

Build
-----

::

    # docker build -t sickbeard .

Create data volume and set permissions::

    # docker run -v /data --name sickbeard_data ubuntu chown -R 22000 /data

Run
---

Systemd service file is also available.  ::

    # docker run -d --volumes-from sickbeard_data -p 8081:8081 --name sickbeard_run sickbeard
