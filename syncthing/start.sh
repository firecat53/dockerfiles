#!/bin/bash

if [ ! -f '/config/config.xml' ]; then
    # Run syncthing to generate initial configuration files, stop it, then edit
    # config.xml to remove 127.0.0.1 limit from the GUI address.
    /syncthing -home=/config &
    sleep 5
    pkill syncthing
    sed -i 's/<address>127.0.0.1:8384<\/address>/<address>:8384<\/address>' /config/config.xml
fi
/syncthing -home=/config
