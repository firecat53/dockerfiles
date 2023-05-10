FROM alpine:3.18

RUN apk --no-cache add wireguard-tools iptables ip6tables

COPY entrypoint.sh /usr/local/bin/

HEALTHCHECK --interval=90s --timeout=30s --start-period=30s \
             CMD wget --no-verbose --tries=1 --spider https://api.ipify.org || exit 1 

CMD ["entrypoint.sh"]
