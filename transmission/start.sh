#! /bin/sh

[ -d /dev/net ] || mkdir -p /dev/net
[ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200

pipework --wait

[ ! -d /config/openvpn ] && cp -a /config_orig/* /config/

./pia_transmission_monitor
