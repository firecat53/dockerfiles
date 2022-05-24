FROM alpine:3.16

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

RUN apk add --no-cache php8-fpm php8-gd php8-iconv php8-json php8-opcache

WORKDIR /var/www

ADD etc/ /etc/

USER nobody

# mark dirs as volumes that need to be writable, allows running the container --read-only
VOLUME ["/tmp"]

ENTRYPOINT ["/usr/sbin/php-fpm7"]
