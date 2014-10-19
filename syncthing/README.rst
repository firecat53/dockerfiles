Docker Syncthing
================

This is a Dockerfile to set up Syncthing.

Mount any desired directories to sync using ``-v <host_dir>:<host_dir>`` when running the container. The config/logging directory will live in a data-only volume (/config). We have to either run Syncthing using supervisord to allow Syncthing to restart itself without killing off the container or using an external container manager like systemd to restart the container after Syncthing restarts.

Build
-----

Create config volume and set permissions::

    # docker run -v /config --name syncthing_config scratch true &> /dev/null
    # docker run -it --rm --volumes-from syncthing_config ubuntu /bin/bash
    root@xxxxx # chown -R 22000 /config

Decide which version of the Dockerfile to use: use the default version if you have an external container manager like systemd that will restart the container automatically when Syncthing restarts. Otherwise use the .supervisord version and rename it to `Dockerfile`.

Update Syncthing version to latest values in the Dockerfile, update desired <username> in the Dockerfile and supervisord.conf. 
   
   *NOTE*: the userid of the <username> you select will not necessarily match the username on your host if the UID isn't the same. If you need it to match, add the '-uid xxxx' option to the useradd command in the Dockerfile.
  
If you want to run Syncthing as root, remove the 'user=' line from supervisord.conf and comment out the 'useradd' and the 'USER' line in the Dockerfile.
  
   ::

    # docker build --rm -t syncthing .

To build from the latest source, run the build.sh script to generate the syncthing binary. Then edit the desired Dockerfile to use the generated syncthing binary instead of downloading the prebuilt binary. See the comments in the Dockerfiles for instructions.

Run
---

Run Syncthing once inside the container to generate the configuration files::

    # docker run --rm -it --volumes-from syncthing_config syncthing /bin/bash
    root@851f9e42ac1c:/# ./syncthing -home /config
    root@851f9e42ac1c:/# chown -R <username>:users /config
    root@851f9e42ac1c:/# vi /config/config.xml

Edit /config/config.xml to change::

    <address>127.0.0.1:8080</address>

to::

    <address>:8080</address>

Systemd service file available.

::

    # docker run -d -v /mnt/media:/mnt/media --volumes-from syncthing_config -p 22000:22000 -p 8080:8080 -p 21025:21025/udp --name syncthing_run syncthing

TODO
----

1. Automate the initial configuration setup
