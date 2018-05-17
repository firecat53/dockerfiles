#!/bin/bash

if [ ! -f '/config/sabnzbd.ini' ]; then
    # Run sabnzbd, stop it, then change to host = ""
    sabnzbdplus -pcd -f /config
    sleep 5
    pkill sabnzbdplus
    sed -i 's/^host = .*/host = ""/' /config/sabnzbd.ini
fi
exec sabnzbdplus -f /config
