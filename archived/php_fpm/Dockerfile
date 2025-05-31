FROM alpine:3.18

LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

RUN apk add --no-cache php81-fpm php81-gd php81-iconv php81-json php81-opcache

WORKDIR /var/www

ADD etc/ /etc/

USER nobody

# mark dirs as volumes that need to be writable, allows running the container --read-only
VOLUME ["/tmp"]

ENTRYPOINT ["/usr/sbin/php-fpm81"]
