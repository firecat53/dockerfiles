#!/bin/sh

set -e

[ -e /etc/wireguard/wg0.conf ] || (echo "No configuration files found in /etc/wireguard" && exit 1)

interface="wg0"

if [ "$(cat /proc/sys/net/ipv4/conf/all/src_valid_mark)" != "1" ]; then
    echo "sysctl net.ipv4.conf.all.src_valid_mark=1 is not set" >&2
    exit 1
fi

sed -i "s:sysctl -q net.ipv4.conf.all.src_valid_mark=1:echo skipping setting net.ipv4.conf.all.src_valid_mark:" /usr/bin/wg-quick
wg-quick up "$interface"

### Allow Local Network connections
if [ -n "${LOCAL_NETWORKS}" ]; then
    eval "$(ip r l | grep -v "$interface\|kernel"|awk '{print "GW="$3"\nINT="$5}')"
    for network in ${LOCAL_NETWORKS//,/ }; do
        ip route add "$network" via "$GW" dev "$INT"
    done
fi

shutdown () {
    wg-quick down "$interface"
    exit 0
}

trap shutdown TERM INT QUIT

sleep infinity &
wait $!
