FROM alpine
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

VOLUME /config
VOLUME /data

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories && \
    apk --no-cache add p7zip py2-pip unrar && \
    apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing add deluge && \
    pip install --no-cache-dir automat \
                               constantly  \
                               incremental \
                               service_identity && \
    apk del py2-pip && \
    adduser -h /config -s /sbin/nologin -D deluge users && \
    echo "deluge:deluge" | chpasswd

COPY start.sh /usr/local/bin/start.sh

USER deluge:users
CMD ["start.sh"]
