#!/bin/sh

[ ! -f /config/settings.json ] && cp /var/lib/transmission/settings.json /config/
sleep 60 && transmission-remote --port "$(cat /var/run/pia_port/pia_port)" &
exec transmission-daemon -f -g /config -i "$(ip addr show tun0|grep inet|awk '{print $2}')"
