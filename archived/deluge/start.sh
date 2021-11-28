#!/bin/sh

umask 002
listen_ip="$(ip route get 1 | awk '{print $5;exit}')"
sed -ie "s|\(\"listen_interface\": \).*|\"listen_interface\": \"$listen_ip\",|" /config/core.conf
deluge-web -L info --config /config
deluged -d -L info --config /config
