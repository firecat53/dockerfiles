Docker Registry
===============

This is a placeholder with a systemd service file for a private `Docker registry`_. It just uses the stock 'registry' image and environment variables in the service file for configuration. Check the Github page above for additional env variables.

Build
-----

If using a data-only volume is desired for the registry::

    # docker run -v /data --name registry_data scratch true &> /dev/null

Run
---

::

    # docker run -d --volumes-from registry_data -p 5000:5000 -e STORAGE_PATH=/data --name registry_run registry

Systemd service file is available.


.. _Docker registry: https://github.com/docker/docker-registry
