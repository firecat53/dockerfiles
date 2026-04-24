FROM alpine:3.23

RUN apk --no-cache add wireguard-tools iptables ip6tables \
 && printf '#!/bin/sh\nif [ "$1" = "-a" ]; then\n  cat > /etc/resolv.conf\nfi\nexit 0\n' > /usr/bin/resolvconf \
 && chmod +x /usr/bin/resolvconf

COPY entrypoint.sh /usr/local/bin/

HEALTHCHECK --interval=90s --timeout=30s --start-period=30s \
             CMD wget --no-verbose --tries=1 --spider https://api.ipify.org || exit 1 

CMD ["entrypoint.sh"]
