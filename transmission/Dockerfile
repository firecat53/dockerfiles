FROM alpine
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG uid=1000
ARG gid=100

COPY settings.json /var/lib/transmission/
COPY start.sh /usr/local/bin/start.sh

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk --no-cache add curl \
                       transmission-cli \
                       transmission-daemon && \
    sed -i "s/transmission:x:[0-9]\+:/transmission:x:$uid:/" /etc/passwd && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    mkdir /config /data && \
    chown -R transmission:users /var/lib/transmission /config /data

USER transmission:users
VOLUME ["/config", "/data"]
CMD ["start.sh"]
