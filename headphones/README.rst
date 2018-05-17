# Headphones

This is a Dockerfile to set up [Headphones][1]

Note: Due to the way the Headphones program runs in the container, the
`Restart` button in the GUI will just shut it down. Restart the container
instead.

## Build

Create config volume and set permissions, then build:

    docker create -v /config --name headphones_config myscratch true
    docker run --rm --volumes-from headphones_config --user root headphones chown -R headphones:users /config
    docker build -t headphones .

# Run

Systemd service file available.

    docker run -d \
               --volumes-from headphones_config \
               -p 8181:8181 \
               --name headphones_run \
               headphones


[1]: https://github.com/rembo10/headphones "Headphones"
