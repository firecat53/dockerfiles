Docker media tools
==================

Simple Dockerfile to install several media file tools that can be used with
mounted media volumes.

* handbrake-cli
* mediainfo
* par2
* mediainfo
* ranger (for easy folder browsing)
* rsync
* unrar (nonfree)

Build
-----

::

    $ docker build -t media_tools .

Usage
-----

::

    $ docker run -it --rm --volumes-from media_data -v /mnt/media:/mnt media_tools /bin/bash
