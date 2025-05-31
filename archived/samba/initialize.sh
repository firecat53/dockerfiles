#!/bin/sh
# Creates the samba_config data volume (if it doesn't already exist) and
# populates it with the smb.conf and users.txt (optional) from the current
# directory. Also use this to update existing smb.conf and/or users.txt.
docker volume create samba_config
docker run --rm -v "$(pwd)":/mnt -v samba_config:/config alpine cp /mnt/smb.conf /mnt/users.txt /config/
