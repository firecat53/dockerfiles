Docker Syncthing Discovery Server
=================================

This is a Dockerfile to set up a self-hosted Syncthing global discovery server
using the latest git build.

Build
-----

To generate cert.pem and key.pem assuming you have a syncthing container with
the executable /syncthing::

    $ ./initialize.sh

::

    # docker build -t syncthing_discovery .

Run
---

Systemd service file available. You can add discosrv flags at the end of the docker run line.

::

    # docker run -d -p 8443:8443 --name syncthing_discovery_run syncthing_discovery

or with arguments::

    # docker run -d -p 8443:8443 --name syncthing_discovery_run syncthing_discovery -stats-intv=30
