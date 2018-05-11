#!/bin/sh

[ ! -f /config/settings.json ] && cp /var/lib/transmission/settings.json /config/
[ -e /var/run/pia/pia_port ] && \
    sleep 60 && \
    transmission-remote --port "$(cat /var/run/pia/pia_port)" &
exec transmission-daemon -f -g /config -i "$(ip route get 1 | awk '{print $NF;exit}')"
