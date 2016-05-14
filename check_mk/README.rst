Docker Check-MK Monitoring
==========================

This is a Dockerfile to set up `Check-MK Monitoring`_ along with
Msmtp send-only mail (using Gmail, Mandrill, etc.) for notifications.

Build
-----

Ensure the correct version from the `downloads page`_ is noted in the
Dockerfile.  If your site requires Check-MK to run with tmpfs, remove the line
in start.sh that disables it, then run the container with either `--priviliged`
or `--cap-add SYS_ADMIN`.

Build from Dockerfile::

    docker build -t check_mk .

Create data-only volume. Check-MK site configurations will be auto-generated in
/opt/omd/sites. ::

    docker run -v /opt/omd/sites -v /config --name check_mk_config ubuntu

Edit the msmtprc and msmtp-aliases files with your email SMTP info. Default
site/user is omd. Then::

    docker cp msmtprc check_mk_config:/config/
    docker cp msmtp-aliases check_mk_config:/config/

Run
___

Systemd service file is also available. ::

    docker run -d --volumes-from check_mk_config -v /etc/localtime:/etc/localtime -p 5000:5000 --name check_mk_run check_mk

Be patient when starting (20-40 seconds). The site has to be generated
initially, then regenerated on subsequent runs to make sure all the permissions
and user/groups are correct. Existing site info will not be overwritten!

Manage
------

The default site name is 'default'. You can use the omd commands to control that
site::

    $ docker exec -it check_mk_run /bin/bash
    # omd --help
    # omd su default
    OMD[defatul]:~$ ....

.. _Check-MK Monitoring: http://mathias-kettner.com/check_mk.html
.. _downloads page: http://mathias-kettner.com/check_mk_download.php?HTML=yes
