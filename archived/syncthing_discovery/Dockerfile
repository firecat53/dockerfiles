FROM alpine:3.11
# Dockerfile to run a self-hosted Syncthing discovery server (latest build).
LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

RUN apk --no-cache add wget && \
    wget --quiet \
        https://build2.syncthing.net/guestAuth/app/rest/builds/id:20878/artifacts/content/stdiscosrv-linux-amd64-v0.14.48-rc.4+11-gd59aecb.tar.gz \
        -O /stdiscosrv.tar.gz && \
    tar -xzf stdiscosrv.tar.gz && \
    rm stdiscosrv.tar.gz && \
    mv stdiscosrv* stdiscosrv && \
    adduser -DHG users syncthing && \
    chown -R syncthing: /stdiscosrv && \
    apk del wget

USER syncthing
WORKDIR /stdiscosrv

ENTRYPOINT ["./stdiscosrv"]
