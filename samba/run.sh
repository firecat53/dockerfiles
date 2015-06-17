#!/bin/bash
if [ -f "/config/users.txt" ]; then
    while read -r USERNAME PASS; do
        useradd -M -g users $USERNAME
        echo "$USERNAME:$PASS" | chpasswd
        echo "$PASS" | smbpasswd -s -a $USERNAME
    done < /config/users.txt
fi
nmbd -D
exec ionice -c 3 smbd -FS --configfile=/config/smb.conf
