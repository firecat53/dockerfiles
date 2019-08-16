FROM alpine

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

RUN apk add --no-cache php7-fpm php7-gd php7-iconv php7-json php7-opcache

WORKDIR /var/www

ADD etc/ /etc/

USER nobody

# mark dirs as volumes that need to be writable, allows running the container --read-only
VOLUME ["/tmp"]

ENTRYPOINT ["/usr/sbin/php-fpm7"]
