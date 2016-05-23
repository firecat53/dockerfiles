#!/bin/bash
# Initialize transmission_config container.
#  Edit USER_ID to match your intended user UID 
USER_ID=22000

docker run -v /config \
    -v $(pwd):/mnt/ \
    --name transmission_config \
    ubuntu bash -c "cp -a /mnt/private/* /mnt/config.ini /config/"
docker run --rm --volumes-from deluge_config ubuntu chown -R $USER_ID:users /config
