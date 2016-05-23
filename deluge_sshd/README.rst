Docker Deluge-Web
==========================

This is a Dockerfile to set up deluge-web with an OpenVPN client attached
through PrivateInternetAccess.com_ and managed with pia_deluge_monitor. In
addition, there is an SSH server running (no shell access allowed, just the
SOCKS proxy) to use as a SOCKS proxy if desired (some sites require their website
access and torrent client IP address to match). You need to have a network
bridge (br0) already setup on the host, because pipework_ is used to establish
the connection so the container can have its own IP address on the network. This
also avoids any port forwarding/open port issues.

Build
-----

First edit the files in private_example and rename private_example to private.
Set the user and group in config.ini as which deluge will run. It is not
normally required, but if you are planning on allowing remote access to the
Deluge daemon, you should edit private/deluge/auth to add a username and
password like::

    <user>:<password>:10

I had to add the "::10" in this file because the web client wasn't able to talk
to the daemon by default otherwise. It's simpler, but **less secure if you
enable remote access**.

Then build from Dockerfile::

	docker build -t deluge_sshd .

Edit UID in initialize.sh to match your intended user then create the data-only
configuration volume for OpenVPN and Deluge settings::

    $ ./initialize.sh

Copy the generated (passwordless) SSH key (deluge_ed25519{.pub}) to your ~/.ssh
directory.

If desired, create a data-only volume for your media. You can also just mount a
directory on the host with the '-v' option instead of using --volumes-from::

    docker run -v /data --name media_data ubuntu chown -R <UID>:users /data

Install pipework_ on the host.

Running the container
---------------------

Docker >= 1.2: the --cap-add=NET_ADMIN flag has to be used so that the tun
device can be created. ::

    docker run -d --cap-add=NET_ADMIN --net=none --volumes-from deluge_sshd_config --volumes-from media_data --name deluge_sshd_run deluge_sshd

Docker < 1.2: the --privileged flag has to be used so that the tun device can be
created. ::

    docker run -d --privileged --net=none --volumes-from deluge_sshd_config --volumes-from media_data --name deluge_sshd_run deluge_sshd

Use pipework to assign a static IP address to the container (Note: br0 is
existing bridge on the host system). The IP must have the CIDR, should be in the
same network address space as the host, and you must specify the gateway (should
be the same as the host uses)::

    # pipework br0 deluge_sshd_run <ip address>/24@<gateway ip>
    # (example) pipework br0 deluge_sshd_run 192.168.0.125/24@192.168.0.1
    where the gateway is 192.168.0.1, the host IP address might be
    192.168.0.101, and the deluge container address is 192.168.0.125

Make sure set the correct path for your torrent downloads in the preferences
before you start downloading. Otherwise the default is /root/ and you will get
permission errors.

Systemd service file is also available.

Accessing the web interface
---------------------------

From inside the local network, http://192.168.0.125:81122. Default password is 'default'.

Accessing the container SOCKS proxy
-----------------------------------

To use the SOCKS proxy within the local network::

    ssh -fND 5000 <deluge user>@192.168.0.125

If you are not in the local network, but you have another server (e.g.
'homeserver') on the network with external SSH access::

    ssh -tL 5000:localhost:5000 homeserver "ssh -fND 5000 -l deluge -i .ssh/deluge_ed25519 192.168.0.125"

Then set your application to access the SOCKS proxy at localhost:5000.

Note: the `ssh -t` will run the tunnel in the foreground and kill the ssh
process on the server when it exits. If you background it with -f instead, it is
easiest to just manually kill the server ssh process after killing the local
tunnel.

.. _PrivateInternetAccess.com: http://privateinternetaccess.com
.. _pipework: https://github.com/jpetazzo/pipework
