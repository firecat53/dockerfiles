Docker Transmission-Daemon
==========================

This is a Dockerfile to set up transmission-daemon with an OpenVPN client attached through PrivateInternetAccess.com_ and managed with pia_transmission_monitor_

Build
-----

First edit the files in private_example and rename private_example to private. Then build from Dockerfile::

	docker build -rm -t transmission . 

Create data-only volume::

    docker run -v /config --name transmission_config busybox /bin/true

Running the container. The --privileged flag has to be used so that the tun device can be created. ::

    docker run -d --privileged --networking=False --volumes-from transmission_config --volumes-from media_data --name transmission transmission 

Use pipework to assign a static IP address to the container (Note: br0 is existing bridge on my system). The IP must have the CIDR and you must specify the gateway::

    # pipework br0 transmission_run <ip address>/24@<gateway ip>

Systemd service file is also available.

.. _PrivateInternetAccess.com: http://privateinternetaccess.com
.. _pia_transmission_monitor: https://github.com/firecat53/pia_transmission_monitor 
