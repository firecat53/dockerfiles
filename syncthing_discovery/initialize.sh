#!/bin/bash
# Generates cert.pem and key.pem using existing Syncthing image
docker run --user $USER --rm -v "$(pwd)":/tmp syncthing syncthing -generate=/tmp
rm ./config.xml
