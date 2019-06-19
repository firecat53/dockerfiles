#!/bin/sh

umask 002
sleep 60 && \
    deluge-console -c /config \
        "config --set listen_interface $(ip route get 1 | awk '{print $7;exit}')" && \
    [ -e /var/run/pia/pia_port ] && \
        deluge-console -c /config \
            "config --set listen_ports ($(cat /var/run/pia/pia_port), $(cat /var/run/pia/pia_port))" &
deluge-web -L info --config /config
deluged -d -L info --config /config
