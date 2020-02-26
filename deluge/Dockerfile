FROM alpine
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG uid=1000
ARG gid=100

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --no-cache add build-base \
                       ca-certificates \
                       libffi-dev \
                       libjpeg-turbo-dev \
                       linux-headers \
                       p7zip \
                       py3-libtorrent-rasterbar \
                       py3-openssl \
                       py3-pip \
                       python3-dev \
                       unrar \
                       unzip \
                       zlib-dev && \
    wget http://download.deluge-torrent.org/source/2.0/deluge-2.0.3.tar.xz && \
    tar -xf deluge-2.0.3.tar.xz && \
    cd deluge-2.0.3 && \
    python3 setup.py clean -a && \
    python3 setup.py build && \
    python3 setup.py install && \
    cd / && \
    rm -rf deluge-2.0.3* && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    adduser -h /config -DG users -u $uid deluge && \
    echo "deluge:deluge" | chpasswd && \
    mkdir /data && \
    chown -R deluge:users /config /data && \
    apk del build-base \
            libffi-dev \
            libjpeg-turbo-dev \
            linux-headers \
            python3-dev \
            zlib-dev

COPY start.sh /usr/local/bin/

USER deluge

VOLUME ["/config", "/data"]

CMD ["start.sh"]
