#!/bin/bash
# Creates the samba_config data-only container and populates it with the
# smb.conf and users.txt (optional) from the current directory. Also use this to
# update existing smb.conf and/or users.txt.
docker run -v /config --name samba_config myscratch true &> /dev/null
docker run --rm --volumes-from samba_config \
    -v $(pwd):/home ubuntu:trusty \
    bash -c "cp /home/{smb.conf,users.txt} /config/ 2>/dev/null || :"
