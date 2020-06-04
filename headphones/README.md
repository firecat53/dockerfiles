# Headphones

This is a Dockerfile to set up [Headphones][1]. A data volume is created named
`headphones_config` to store config data.

Note: Due to the way the Headphones program runs in the container, the
`Restart` button in the GUI will just shut it down. Restart the container
instead.

## Build

    docker build -t headphones .

# Run

Systemd service file available.

    docker run -d \
               --mount type=volume,source=headphones_config,target=/config \
               -p 8181:8181 \
               -v /etc/localtime:/etc/localtime:ro \
               --name headphones_run \
               headphones


[1]: https://github.com/rembo10/headphones "Headphones"
