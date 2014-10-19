Docker CrashPlan
================

This is a Dockerfile to set up `Crashplan`_.

Build
-----

First create a data-only volume for the CrashPlan software to live along with it's cache and logs. This is necessary to make sure you receive all the automatic updates and to retain program status between runs::

	docker run -v /opt/crashplan --name crashplan_data scratch true &> /dev/null

Now build the Docker image::

    docker build --rm -t crashplan .

Run
___

On the first run, CrashPlan will be installed to the data-only volume at /opt/crashplan. Mount whatever backup volumes are desired using -v (or --volumes-from if the data is in a container). Systemd service file is also available. ::

    docker run -h <host_name> -d --volumes-from crashplan_data -v /mnt/backup:/mnt/backup -p 4243:4243 -p 4242:4242 --name crashplan_run crashplan

Access
______

On the client, follow the instructions for running a `headless client`_ using SSH. To summarize::

    # sed -i 's/.*servicePort.*/servicePort 4200/' /opt/crashplan/conf/ui.properties
    $ ssh -fNL 4200:localhost:4243 homeserver
    $ CrashPlanDesktop

.. _CrashPlan: http://www.code42.com/crashplan/
.. _headless client: http://support.code42.com/CrashPlan/Latest/Configuring/Configuring_A_Headless_Client#Using_SSH
