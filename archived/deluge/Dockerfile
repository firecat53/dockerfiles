FROM alpine:3.15
LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

ARG uid=1000
ARG gid=100

RUN apk --no-cache add build-base \
                       libffi-dev \
                       py3-cryptography \
                       py3-libtorrent-rasterbar \
                       py3-pillow \
                       py3-pip \
                       py3-setuptools \
                       py3-wheel \
                       python3-dev \
                       zlib-dev && \
    pip install deluge && \
    # Fix version 2.0.3 bug #3327
    sed -i "s/stack_info=False/*args, **kwargs/" /usr/lib/python3.9/site-packages/deluge/log.py && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    adduser -Dh /config -G users -u $uid deluge && \
    echo "deluge:deluge" | chpasswd && \
    mkdir /data && \
    chown -R deluge:users /config /data && \
    apk del build-base \
            libffi-dev \
            py3-pip \
            py3-wheel \
            zlib-dev
            
COPY start.sh /usr/local/bin/

USER deluge

VOLUME ["/config", "/data"]

CMD ["start.sh"]
