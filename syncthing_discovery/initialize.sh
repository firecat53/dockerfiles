#!/bin/bash
# Generates cert.pem and key.pem using existing Syncthing image
docker run --rm -v $(pwd):/mnt syncthing /syncthing -generate=/mnt
rm ./config.xml
