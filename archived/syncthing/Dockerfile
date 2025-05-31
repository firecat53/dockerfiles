FROM alpine:3.18
LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

ARG uid=1000
ARG gid=100
ARG user=syncthing

RUN apk --no-cache add ca-certificates curl && \
    tag=$(curl -sX GET "https://api.github.com/repos/syncthing/syncthing/releases/latest" \
        | awk '/tag_name/{print $4;exit}' FS='[""]') && \
    curl -o \
        /tmp/syncthing.tar.gz -L \
        https://github.com/syncthing/syncthing/releases/download/$tag/syncthing-linux-amd64-$tag.tar.gz && \
    tar xf /tmp/syncthing.tar.gz -C /tmp/ && \
    mv /tmp/sync*/syncthing /usr/local/bin/syncthing && \
    mkdir /config && \
    # Change `users` gid to match the passed in $gid if not root user
    if [ $uid != "0"]; then \
        [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
        adduser -h /home/syncthing -DG users -u $uid syncthing && \
        chown -R syncthing:users /config; \
    fi && \
    apk del curl && \
    rm -rf /tmp/*

USER $user

ENTRYPOINT ["syncthing"]
CMD ["-home=/config", "-gui-address=0.0.0.0:8384"]
