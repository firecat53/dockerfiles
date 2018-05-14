FROM alpine
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG VERSION=v0.14.47
ARG SYNCTHING_USER=syncthing
ARG UID=22000

COPY start.sh /usr/local/bin/

RUN apk --no-cache add ca-certificates wget && \
    wget --quiet https://github.com/syncthing/syncthing/releases/download/$VERSION/syncthing-linux-amd64-$VERSION.tar.gz -O /syncthing.tar.gz && \
    tar -xzf syncthing.tar.gz && \
    mv sync*/syncthing /usr/local/bin/syncthing && \
    rm -rf syncthing.tar.gz syncthing-linux* && \
    adduser -DHG users -u $UID $SYNCTHING_USER && \
    apk del wget

USER $SYNCTHING_USER

CMD ["start.sh"]
