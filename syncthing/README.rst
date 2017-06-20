Docker Syncthing
================

This is a Dockerfile to set up Syncthing.

Mount any desired directories to sync using ``-v <host_dir>:<host_dir>`` when
running the container. The config/logging directory will live in a data-only
volume (/config). We have to either run Syncthing using supervisord to allow
Syncthing to restart itself without killing off the container or using an
external container manager like systemd to restart the container after Syncthing
restarts.

Build
-----

Create config volume and set permissions::

    # docker run -v /config --name syncthing_config ubuntu chown -R 22000 /config

Decide which version of the Dockerfile to use: use the default version if you
have an external container manager like systemd that will restart the container
automatically when Syncthing restarts. Otherwise use the .supervisord version.

Update Syncthing version to latest values in the Dockerfile, update desired
<username> in the Dockerfile and supervisord.conf. 
   
   *NOTE*: the userid of the <username> you select will not necessarily match
   the username on your host if the UID isn't the same. If you need it to match,
   add the '-uid xxxx' option to the useradd command in the Dockerfile.
  
If you want to run Syncthing as root, remove the 'user=' line from
supervisord.conf and comment out the 'useradd' and the 'USER' line in the
Dockerfile.
  
   ::

    # docker build -t syncthing .

To build a specific version, pass the `--build-arg` flag::

    # docker build -t syncthing --build-arg version=v0.14.29 .

Run
---

Systemd service file available. Edit to enable or disable 'host' networking as
necessary for local discovery needs.

::

    # docker run -d --net='host' -v /mnt/media:/mnt/media --volumes-from syncthing_config -p 22000:22000 -p 8384:8384 -p 21027:21027/udp --name syncthing_run syncthing

Local Discovery
---------------

Local discovery between nodes will not work unless the container is run with
'host' networking instead of the default 'bridge' networking. Enable 'host'
networking by adding `--net=host` to the `docker run` line.

See here_ for precautions when running the container with 'host' networking.

If you are running an nginx reverse-proxy inside a container on the same host to
redirect traffic to the syncthing GUI (e.g. syncthing.myip.net ->
<containerIP:GUIport>), you will not be able to run syncthing in 'host'
networking mode and still have it accessible via the reverse proxy. At least not
without some more complex configuring! 

.. _here: https://docs.docker.com/articles/networking/#how-docker-networks-a-container
