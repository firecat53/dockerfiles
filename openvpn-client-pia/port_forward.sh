#!/usr/bin/env sh
#
# Enable port forwarding when using Private Internet Access
# Store forwarded port in /var/run/pia/pia_port

sleep 15  # Ensure tunnel creation is complete
client_id=$(head -n 100 /dev/urandom | sha256sum | tr -d " -")
json=$(curl "http://209.222.18.222:2000/?client_id=$client_id" 2>/dev/null)
if [ "$json" = "" ]; then
    echo 'Port forwarding is already activated on this connection, has expired, or you are not connected to a PIA region that supports port forwarding'
else
    printf "Forwarded port: "
    echo "$json" | tr -dc '0-9' | tee /var/run/pia/pia_port
fi
