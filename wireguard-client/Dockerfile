FROM alpine:3.12

RUN apk --no-cache add wireguard-tools iptables ip6tables

COPY entrypoint.sh /usr/local/bin/

VOLUME /etc/wireguard

HEALTHCHECK --interval=90s --timeout=30s --start-period=30s \
             CMD wget --no-verbose --tries=1 --spider https://api.ipify.org || exit 1 

CMD ["entrypoint.sh"]
