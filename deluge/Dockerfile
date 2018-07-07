FROM alpine
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG uid=1000
ARG gid=100

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
    apk --no-cache add p7zip py2-pip unrar && \
    apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing add deluge && \
    pip install --no-cache-dir automat \
                               constantly  \
                               incremental \
                               service_identity && \
    apk del py2-pip && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    adduser -h /config -s /sbin/nologin -DG users -u $uid deluge && \
    echo "deluge:deluge" | chpasswd && \
    mkdir /data && \
    chown -R deluge:users /config /data

COPY start.sh /usr/local/bin/

USER deluge

VOLUME ["/config", "/data"]

CMD ["start.sh"]
