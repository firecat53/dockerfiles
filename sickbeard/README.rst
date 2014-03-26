Docker CouchPotato
==================

This is a Dockerfile to set up Sickbeard. It creates volume mount point at /data (location for your downloads and config file).

Build
-----

::

    # docker build -t sickbeard .

Create data volume::

    # docker run -v /data --name sickbeard_data busybox /bin/true

Run
---

::

    # docker run -d --volumes-from sickbeard_data -p 8081:8081 --name sickbeard sickbeard
