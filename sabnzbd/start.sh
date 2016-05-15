#!/bin/bash

if [ ! -f '/config/sabnzbd.ini' ]; then
    # Run sabnzbd, stop it, then change to host = ""
    sabnzbdplus -d -f /config
    sleep 5
    pkill sabnzbdplus
    sed -i 's/^host = .*/host = ""/' /config/sabnzbd.ini
fi
sabnzbdplus -f /config
