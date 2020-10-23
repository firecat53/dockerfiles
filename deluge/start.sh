#!/bin/sh

umask 002
sleep 10 && \
    deluge-console -c /config \
        "config --set listen_interface $(ip route get 1 | awk '{print $7;exit}')" && \
deluge-web -L info --config /config
deluged -d -L info --config /config
