Docker Headphones
=================

This is a Dockerfile to set up Headphones. Create a volume mount point at /data for data.

Build
-----

::

    # docker build -t headphones .

Create data volume and set permissions::

    # docker run -v /data --name headphones_data scratch /bin/true &> /dev/null
    # docker run -it --rm --volumes-from headphones_data ubuntu /bin/bash
    root@xxxxx # chown -R 22000 /data


Run
---

Systemd service file is also available.  ::

    # docker run -d --volumes-from headphones_data -p 8181:8181 --name headphones_run headphones
