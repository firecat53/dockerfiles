Docker CouchPotato
==================

This is a Dockerfile to set up CouchPotato. It creates volume mount point at /data (location for your downloads and config file).

Build
-----

::

    # docker build -t couchpotato .

Create data volume::

    # docker run -v /data --name couchpotato_data busybox /bin/true

Run
---

::

    # docker run -d --volumes-from couchpotato_data -p 5050:5050 --name couchpotato couchpotato
