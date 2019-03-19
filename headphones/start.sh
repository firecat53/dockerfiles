#!/bin/bash

if [ ! -f '/config/config.ini' ]; then
    # Run headphones, stop it, then edit customhost and http_host to 0.0.0.0
    python Headphones.py --datadir /config --nolaunch
    sleep 5
    pkill python
    sed -i 's/^http_host.*/http_host = 0.0.0.0/' /config/config.ini
    sed -i 's/^customhost.*/customhost = 0.0.0.0/' /config/config.ini
fi
python Headphones.py --datadir /config --nolaunch
