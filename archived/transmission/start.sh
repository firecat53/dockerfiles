#!/bin/sh

[ ! -f /config/settings.json ] && cp /var/lib/transmission/settings.json /config/
exec transmission-daemon -f -g /config -i "$(ip route get 1 | awk '{print $NF;exit}')"
