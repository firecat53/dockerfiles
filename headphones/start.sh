#!/bin/bash

if [ ! -f '/data/config.ini' ]; then
    # Run headphones, stop it, then edit customhost and http_host to 0.0.0.0
    python Headphones.py --datadir /data --nolaunch
    sleep 5
    pkill python
    sed -i 's/^http_host.*/http_host = 0.0.0.0/' /data/config.ini
    sed -i 's/^customhost.*/customhost = 0.0.0.0/' /data/config.ini
fi
python Headphones.py --datadir /data --nolaunch
