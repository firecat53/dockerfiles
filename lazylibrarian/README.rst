Docker LazyLibrarian
====================

This is a Dockerfile to set up LazyLibrarian_.

Build
-----

Create config volume and set permissions::

    # docker run -v /config --name lazylibrarian_config ubuntu chown -R 22000 /config

Then::

    # docker build -t lazylibrarian .

Run
---

Systemd service file available.

::

    # docker run -d --volumes-from lazylibrarian_config --volumes-from media_data -p 5299:5299 --name lazylibrarian_run lazylibrarian


.. _LazyLibrarian: https://github.com/DobyTang/LazyLibrarian
