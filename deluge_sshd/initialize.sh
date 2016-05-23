#!/bin/bash
# Initialize deluge_sshd_config container. Creates passwordless SSH key.
#  Edit USER_ID to match your intended user UID 
USER_ID=22000

[ -f deluge_ed25519 ] || ssh-keygen -t ed25519 -N '' -q -f deluge_ed25519

docker run -v /config \
    -v $(pwd):/mnt/ \
    --name deluge_sshd_config \
    ubuntu bash -c "cp -a /mnt/private/* /mnt/deluge_ed25519.pub /mnt/config.ini /config/"
docker run --rm --volumes-from deluge_sshd_config ubuntu chown -R $USER_ID:users /config
