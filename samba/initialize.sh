#!/bin/sh
# Creates the samba_config data-only container (if it doesn't already exist) and
# populates it with the smb.conf and users.txt (optional) from the current
# directory. Also use this to update existing smb.conf and/or users.txt.
docker create -v /config --name samba_config myscratch true 2>/dev/null || :
docker cp smb.conf samba_config:/config/ 2>/dev/null || :
docker cp users.txt samba_config:/config/ 2>/dev/null || :
