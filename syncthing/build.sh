#!/bin/bash
# Builds the syncthing_build Docker container and builds syncthing from the
# latest git. The syncthing binary is copied to this directory.
[[ -f Dockerfile.source_build ]] || { echo "Can't find Dockerfile.source_build" >&2 ; exit 1; }
mv Dockerfile Dockerfile.bak && mv Dockerfile.source_build Dockerfile
docker build -t syncthing_build .
docker run --name syncthing_build_run syncthing_build
docker cp syncthing_build_run:/go/src/github.com/syncthing/syncthing/bin/syncthing .
docker rm syncthing_build_run
echo "Binary copied to ./syncthing. If desired remove the build image (docker rm syncthing_build)"
mv Dockerfile Dockerfile.source_build && mv Dockerfile.bak Dockerfile
