# Docker Syncthing

This is a Dockerfile to set up Syncthing.

Mount any desired directories to sync using ``-v <host_dir>:<host_dir>`` when
running the container. The config/logging directory will live in a data-only
volume (/config). We have to run Syncthing using an external container manager
like systemd to restart the container after Syncthing updates and/or restarts.

## Build

Most recent release will be built.

*NOTE*: To prevent permissions problems, build Syncthing to match the uid and
gid of the user who will be running Syncthing.

    docker build --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t syncthing .

Create config volume and set permissions::

    docker create -v /config --name syncthing_config myscratch true
    docker run --rm --volumes-from syncthing_config --user root syncthing chown -R syncthing:users /config

## Run

Systemd service file available. Edit to enable or disable 'host' networking as
necessary for local discovery needs. Pass additional arguments to syncthing
after the image name if desired. Default entrypoint is `syncthing` and default
CMD is `-home=/config -gui-address=0.0.0.0:8384`

    docker run -d \
               -v /mnt/media:/mnt/media \
               --volumes-from syncthing_config \
               -p 22000:22000 \
               -p 8384:8384 \
               -p 21027:21027/udp \
               --name syncthing_run \
               syncthing

## Local Discovery

Local discovery between nodes will not work unless the container is run with
'host' networking instead of the default 'bridge' networking. Enable 'host'
networking by adding `--net=host` to the `docker run` line.

See [here][1] for precautions when running the container with 'host' networking.

If you are running an nginx reverse-proxy inside a container on the same host to
redirect traffic to the syncthing GUI (e.g. syncthing.myip.net ->
<containerIP:GUIport>), you will not be able to run syncthing in 'host'
networking mode and still have it accessible via the reverse proxy. At least not
without some more complex configuring! 

[1]: https://docs.docker.com/network/host/
