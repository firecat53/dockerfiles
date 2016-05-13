Docker Gollum
=============

This is a Dockerfile to set up the Gollum_ personal wiki.

Build
-----

Configure your user and UID in the Dockerfile first (these should match the user
that owns the host directory containing the wiki), then build the image::

    # docker build -t gollum .

Instead of using a data-only volume, create a local directory on the host so the
wiki can be edited/viewed from the command line as well as the web interface.

Run
---

Systemd service file is also available (edit paths and user first). Any
additional arguments to Gollum can be added after the image name in the docker
run line. If you have an existing .gitconfig, you can bind-mount it into the
container to add your username to the git commit history (otherwise it shows up
as 'Anonymous')::

    # docker run -d -p 4567:4567 -v /path/to/wiki:/home/<user>/wiki -v /home/<user>/.gitconfig:/home/<user>/.gitconfig:ro --name gollum_run --user <user> gollum --allow-uploads page --show-all

If you make changes to the wiki on the host machine, the changes won't
be visible in Gollum until they are committed to the repository.

.. _Gollum: https://github.com/gollum/gollum
