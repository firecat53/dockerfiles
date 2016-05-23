Docker Transmission-Daemon
==========================

This is a Dockerfile to set up transmission-daemon with an OpenVPN client
attached through PrivateInternetAccess.com_ and managed with
pia_transmission_monitor_. You need to have a network bridge (br0) already setup
on the host, because pipework_ is used to establish the connection so the
container can have it's own IP address on the network. This also avoids any port
forwarding/open port issues.

Build
-----

First edit the files in private_example and rename `private_example` to `private`.
Set the user and group in config.ini that the transmission-daemon will run as.
Then build from Dockerfile::

	docker build -t transmission .

Edit UID in initialize.sh to match your intended user then create the data-only
configuration volume for OpenVPN and Transmission settings::

    $ ./initialize.sh

If desired, create a data-only volume for your media. You can also just mount a
directory on the host with the '-v' option instead of using --volumes-from::

    docker run -v /data --name media_data ubuntu chown -R <UID>:users /data

Install pipework_ on the host.

Running the container
---------------------

Docker >= 1.2: the --cap-add=NET_ADMIN flag has to be used so that the tun
device can be created. ::

    docker run -d --cap-add=NET_ADMIN --net=none --volumes-from transmission_config --volumes-from media_data --name transmission_run transmission

Docker < 1.2: the --privileged flag has to be used so that the tun device can be
created. ::

    docker run -d --privileged --net=none --volumes-from transmission_config --volumes-from media_data --name transmission_run transmission

Use pipework to assign a static IP address to the container (Note: br0 is
existing bridge on the host system). The IP must have the CIDR, should be in the
same network address space as the host, and you must specify the gateway (should
be the same as the host uses)::

    # pipework br0 transmission_run <ip address>/24@<gateway ip>
    # (example) pipework br0 transmission_run 192.168.0.123/24@192.168.0.1
    where the gateway is 192.168.0.1, the host IP address might be
    192.168.0.101, and the transmission container address is 192.168.0.123

Systemd service file is also available.

Accessing the web interface
---------------------------

From inside the local network, http://192.168.0.123:9091/transmission/web.

.. _PrivateInternetAccess.com: http://privateinternetaccess.com
.. _pia_transmission_monitor: https://github.com/firecat53/pia_transmission_monitor 
.. _pipework: https://github.com/jpetazzo/pipework
