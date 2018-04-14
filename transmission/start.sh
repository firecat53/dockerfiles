#!/bin/sh

[ ! -f /config/settings.json ] && cp /var/lib/transmission/settings.json /config/
sleep 20 && transmission-remote --port "$(cat /var/run/pia_port/pia_port)" &
exec transmission-daemon -f -g /config
