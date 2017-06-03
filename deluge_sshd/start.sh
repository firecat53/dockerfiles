#! /bin/bash

[ -d /dev/net ] || mkdir -p /dev/net
[ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200

pipework --wait

cp /config/deluge_ed25519.pub "/etc/ssh/$DELUGE_SSHD_USER"
chown "$DELUGE_SSHD_USER" "/etc/ssh/$DELUGE_SSHD_USER"
chmod 600 "/etc/ssh/$DELUGE_SSHD_USER"

mkdir /var/run/sshd
/usr/sbin/sshd

./pia_deluge_monitor
