FROM alpine
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG uid=1000
ARG gid=100

RUN apk --no-cache add ca-certificates curl && \
    tag=$(curl -sX GET "https://api.github.com/repos/syncthing/syncthing/releases/latest" \
        | awk '/tag_name/{print $4;exit}' FS='[""]') && \
    curl -o \
        /tmp/syncthing.tar.gz -L \
        https://github.com/syncthing/syncthing/releases/download/$tag/syncthing-linux-amd64-$tag.tar.gz && \
    tar xf /tmp/syncthing.tar.gz -C /tmp/ && \
    mv /tmp/sync*/syncthing /usr/local/bin/syncthing && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    adduser -h /home/syncthing -DG users -u $uid syncthing && \
    mkdir /config && \
    chown -R syncthing:users /config && \
    apk del curl && \
    rm -rf /tmp/*

USER syncthing

ENTRYPOINT ["syncthing"]
CMD ["-home=/config", "-gui-address=0.0.0.0:8384"]
