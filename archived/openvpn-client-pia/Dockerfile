FROM alpine:3.12
LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

# Install openvpn
RUN apk --no-cache --no-progress add curl openvpn && \
    printf '#!/usr/bin/env sh\n/usr/local/bin/port_forward.sh &\n' > /usr/local/bin/up.sh && \
    chmod +x /usr/local/bin/up.sh && \
    rm -rf /tmp/*

COPY port_forward.sh /usr/local/bin/port_forward.sh

HEALTHCHECK --interval=90s --timeout=30s --start-period=120s \
             CMD curl -L 'https://api.ipify.org'

VOLUME ["/config"]

ENTRYPOINT openvpn \
                --cd /config \
                --config /config/pia.ovpn \
                --inactive 3600 \
                --keepalive 10 60 \
                --mssfix 1450 \
                --mute-replay-warnings \
                --route-delay 2 \
                --route-up "/sbin/ip route del default" \
                --script-security 2 \
                --setenv LOCAL_NETWORKS $LOCAL_NETWORKS \
                --up /usr/local/bin/up.sh \
                --up-delay
