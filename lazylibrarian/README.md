# LazyLibrarian

This is a Dockerfile to set up [LazyLibrarian][1]. A data volume is created
named `lazylibarian_config` to save config data.

Note: Due to the way the LazyLibrarian program runs in the container, the
`Restart` button in the GUI will just shut it down. Restart the container
instead.

## Build

    docker build -t lazylibrarian .
 
# Run

Systemd service file available.

    docker run -d \
               --mount type=volume,source=lazylibrarian_config,target=/config \
               -p 5299:5299 \
               --name lazylibrarian_run \
               lazylibrarian


[1]: https://github.com/DobyTang/LazyLibrarian "LazyLibrarian"
