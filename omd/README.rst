Docker Open Monitoring Distribution (OMD)
=========================================

This is a Dockerfile to set up the `Open Monitoring Distribution`_ along with Msmtp send-only mail (using Gmail, Mandrill, etc.) for notifications.

Build
-----

If your site requires OMD to run with tmpfs, remove the line in start.sh that disables it, then run the container with either `--priviliged` or `--cap-add SYS_ADMIN`.

Build from Dockerfile::

	docker build -rm -t omd . 

Create data-only volume. OMD site configurations will be auto-generated in /opt/omd/sites. ::

    docker run -v /opt/omd/sites -v /config --name omd_config scratch true &> /dev/null

Edit the msmtprc and msmtp-aliases files with your email SMTP info. Default site/user is omd. Then::

    docker run --volumes-from omd_config -v $(pwd):/home -it ubuntu /bin/bash
    root@xxxxx # cp /home/msmtp* /config/
    root@xxxxx # exit

Run
___

Systemd service file is also available. ::

    docker run -d --volumes-from omd_config -v /etc/localtime:/etc/localtime -p 5000:5000 --name omd_run omd

Be patient when starting (20-40 seconds). The site has to be generated initially, then regenerated on subsequent runs to make sure all the permissions and user/groups are correct. Existing site info will not be overwritten!

.. _Open Monitoring Distribution: http://omdistro.org/
