Docker Transmission-Daemon
==========================

This is a Dockerfile to set up transmission-daemon with an OpenVPN client attached through PrivateInternetAccess.com_ and managed with pia_transmission_monitor_

Build from docker file::

	docker build -rm -t transmission . 

Create data-only volumes::

    docker run -v /data --name transmission_data busybox /bin/true
    docker run -v /config --name transmission_config busybox /bin/true

Running the container. The IP must have the CIDR. ::

    docker run -d -h <hostname> --volumes-from transmission_config --volumes-from transmission_data --name transmission transmission 
Use pipework to assign a static IP address to the container (Note: br0 is existing bridge on my system)::

    # pipework br0 <plex container ID> 192.168.0.241/24


.. _PrivateInternetAccess.com: http://privateinternetaccess.com
.. _pia_transmission_monitor: https://github.com/firecat53/pia_transmission_monitor 
