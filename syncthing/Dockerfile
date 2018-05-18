FROM alpine
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG VERSION=v0.14.47
ARG uid=1000
ARG gid=100

COPY start.sh /usr/local/bin/

RUN apk --no-cache add ca-certificates wget && \
    wget --quiet https://github.com/syncthing/syncthing/releases/download/$VERSION/syncthing-linux-amd64-$VERSION.tar.gz -O /syncthing.tar.gz && \
    tar -xzf syncthing.tar.gz && \
    mv sync*/syncthing /usr/local/bin/syncthing && \
    rm -rf syncthing.tar.gz syncthing-linux* && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    adduser -DHG users -u $uid syncthing && \
    apk del wget

USER syncthing

CMD ["start.sh"]
