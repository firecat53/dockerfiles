#!/bin/sh

CONF="$HOME/qBittorrent/qBittorrent.conf"
umask 002
listen_int="$(ip route get 1 | awk '{print $3;exit}')"
listen_ip="$(ip route get 1 | awk '{print $5;exit}')"
[ -n "$CONF" ] && (mkdir -p "$HOME/qBittorrent" && cp /usr/local/share/qBittorrent/qBittorrent.conf "$CONF")
if grep -q 'Connection\\Interface=' "$CONF"; then
    sed -i "s/^Connection\\\Interface=.*/Connection\\\Interface=$listen_int/" "$CONF";
else
    sed -i "/^\[Preferences\]/a Connection\\\Interface=$listen_int" "$CONF"
fi
if grep -q 'Connection\\InterfaceAddress=' "$CONF"; then
    sed -i "s/^Connection\\\InterfaceAddress=.*/Connection\\\InterfaceAddress=$listen_ip/" "$CONF";
else
    sed -i "/^\[Preferences\]/a Connection\\\Interface=$listen_ip" "$CONF"
fi
qbittorrent-nox
