# Deluge

Simple deluge container. Designed to be run using the network stack from an
OpenVPN container. Also contains p7zip and unrar for the extractor plugin.

#### Defaults:

- Runs as user `deluge`. Default group `users`. Default password is `deluge`.
- Config directory: `/config/`
- Download volume: `/data/` (change Download path in web UI on first run)

## Build

    docker build -t deluge .
    docker create -v /config --name deluge_config myscratch true
    docker run --rm --volumes-from deluge_config --user root deluge chown -R deluge:users /config

A bind-mounted volume can be used in place of the data-only volume for
deluge_config.

Make sure the downloads directory has `g+w` set and is part of the `users` group.

## Run

<b>NOTE:</b> The port publishing (`-p 8112:8112`) needs to be done on the
openvpn container.

Make sure to run with the `--init` flag to ensure container is properly
shutdown.

    docker run -d \
               --net=container:openvpn_run \
               --volumes-from deluge_config \
               --volumes-from pia_port \
               -v /media/downloads:/data \
               -v /etc/localtime:/etc/localtime:ro \
               --name deluge_run \
               --init \
               deluge
