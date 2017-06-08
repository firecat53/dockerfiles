#!/bin/bash
# Generates cert.pem and key.pem using existing Syncthing image
docker run --user root --rm -v $(pwd):/mnt syncthing /syncthing -generate=/mnt
chmod 644 *.pem
rm ./config.xml
