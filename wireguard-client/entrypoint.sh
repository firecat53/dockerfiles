#!/bin/sh

set -e

configs="$(find /etc/wireguard -type f)"
if [ -z "$configs" ]; then
    echo "No configuration files found in /etc/wireguard" >&2
    exit 1
fi

config="$(echo "$configs" | head -n 1)"
interface="$(basename "$config" .conf)"

if [ "$(cat /proc/sys/net/ipv4/conf/all/src_valid_mark)" != "1" ]; then
    echo "sysctl net.ipv4.conf.all.src_valid_mark=1 is not set" >&2
    exit 1
fi

sed -i "s:sysctl -q net.ipv4.conf.all.src_valid_mark=1:echo skipping setting net.ipv4.conf.all.src_valid_mark:" /usr/bin/wg-quick
wg-quick up "$config"

## Kill switch iptables rules
docker_network="$(ip -o addr show dev eth0 | awk '$3 == "inet" {print $4}')"
docker_network_rule=$([ -n "$docker_network" ] && echo "! -d $docker_network" || echo "")
iptables -I OUTPUT ! -o "$interface" -m mark ! --mark "$(wg show "$interface" fwmark)" -m addrtype ! --dst-type LOCAL $docker_network_rule -j REJECT

docker6_network="$(ip -o addr show dev eth0 | awk '$3 == "inet6" {print $4}')"
if [ -z "$docker6_network" ]; then
    echo "Skipping ipv6 killswitch setup since ipv6 interface was not found..." >&2
else
    docker6_network_rule="$([ -n "$docker6_network" ] && echo "! -d $docker6_network" || echo "")"
    ip6tables -I OUTPUT ! -o "$interface" -m mark ! --mark "$(wg show "$interface" fwmark)" -m addrtype ! --dst-type LOCAL $docker6_network_rule -j REJECT
fi

shutdown () {
    wg-quick down "$interface"
    exit 0
}

trap shutdown TERM INT QUIT

sleep infinity &
wait $!
