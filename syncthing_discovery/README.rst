Docker Syncthing Discovery Server
=================================

This is a Dockerfile to set up a self-hosted Syncthing global discovery server.

Build
-----

::

    # docker build --rm -t syncthing_discovery .

Run
---

Systemd service file available. You can add discosrv flags at the end of the docker run line.

::

    # docker run -d 22026:22026/udp --name syncthing_discovery_run syncthing_discovery

or with arguments::

    # docker run -d 22026:22026/udp --name syncthing_discovery_run syncthing_discovery -stats-intv=30
