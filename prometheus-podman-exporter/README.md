# Podman prometheus-podman-exporter

https://github.com/containers/prometheus-podman-exporter

## Build

Most recent release will be built (Alpine image base). For running as user (for
rootless Podman):

    podman build -f Containerfile.user --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t ppe .

For rootful Podman:

    podman build -t ppe .

## Run

Systemd service file available.

    podman run \
    -e CONTAINER_HOST=unix:///run/podman/podman.sock \
    -v $XDG_RUNTIME_DIR/podman/podman.sock:/run/podman/podman.sock:Z \
    --userns=keep-id \
    --security-opt label=disable \
    ppe
