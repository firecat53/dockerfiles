#!/bin/sh

echo "::10" > /config/auth
sleep 60 && \
    deluge-console -c /config \
    "config -s listen_ports ($(cat /var/run/pia/pia_port), $(cat /var/run/pia/pia_port))" && \
    deluge-console -c /config \
    "config -s listen_interface $(ip addr show tun0 | grep inet | awk '{print $2}')" &
deluge-web --fork --config /config
deluged -d -L info --config /config
