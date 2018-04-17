#!/bin/sh

echo "::10" > /config/auth
sleep 20 && \
    deluge-console -c /config \
    "config -s listen_ports ($(cat /var/run/pia_port/pia_port), $(cat /var/run/pia_port/pia_port))" &
deluge-web --fork --config /config
deluged -d -L info --config /config
