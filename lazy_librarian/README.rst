Docker LazyLibrarian
====================

This is a Dockerfile to set up LazyLibrarian_.

Build
-----

Create config volume::

    # docker run -v /config --name lazylibrarian_config busybox /bin/true

Then::

    # docker build -t lazylibrarian .

Run
---

::

    # docker run -d --volumes-from lazylibrarian_config --volumes-from sabnzbd_data -p 5299:5299 --name lazylibrarian_run lazylibrarian


.. _LazyLibrarian: https://github.com/itsmegb/LazyLibrarian

