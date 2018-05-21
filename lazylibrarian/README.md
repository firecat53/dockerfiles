# LazyLibrarian

This is a Dockerfile to set up [LazyLibrarian][1]

Note: Due to the way the LazyLibrarian program runs in the container, the
`Restart` button in the GUI will just shut it down. Restart the container
instead.

## Build

Build, then create config volume and set permissions:

    docker build -t lazylibrarian .
    docker create -v /config --name lazylibrarian_config myscratch true
    docker run --rm --volumes-from lazylibrarian_config --user root lazylibrarian chown -R lazy:users /config

# Run

Systemd service file available.

    docker run -d \
               --volumes-from lazylibrarian_config \
               -p 5299:5299 \
               --name lazylibrarian_run \
               lazylibrarian


[1]: https://github.com/DobyTang/LazyLibrarian "LazyLibrarian"
