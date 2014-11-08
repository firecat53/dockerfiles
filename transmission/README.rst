Docker Transmission-Daemon
==========================

This is a Dockerfile to set up transmission-daemon with an OpenVPN client attached through PrivateInternetAccess.com_ and managed with pia_transmission_monitor_. You need to have a network bridge (br0) already setup on the host, because pipework_ is used to establish the connection so the container can have it's own IP address on the network. This also avoids any port forwarding/open port issues.

Build
-----

First edit the files in private_example and rename private_example to private. Set the user and group in config.ini that the transmission-daemon will run as. Then build from Dockerfile::

	docker build -rm -t transmission .

Create data-only volume::

    docker run -v /config --name transmission_config scratch true &> /dev/null

Install pipework_ on the host.

Running the container
---------------------

Docker >= 1.2: the --cap-add=NET_ADMIN flag has to be used so that the tun device can be created. ::

    docker run -d --cap-add=NET_ADMIN --net=none --volumes-from transmission_config --volumes-from media_data --name transmission_run transmission

Docker < 1.2: the --privileged flag has to be used so that the tun device can be created. ::

    docker run -d --privileged --net=none --volumes-from transmission_config --volumes-from media_data --name transmission_run transmission

Use pipework to assign a static IP address to the container (Note: br0 is existing bridge on the host system). The IP must have the CIDR and you must specify the gateway::

    # pipework br0 transmission_run <ip address>/24@<gateway ip>

Systemd service file is also available.

.. _PrivateInternetAccess.com: http://privateinternetaccess.com
.. _pia_transmission_monitor: https://github.com/firecat53/pia_transmission_monitor 
.. _pipework: https://github.com/jpetazzo/pipework
