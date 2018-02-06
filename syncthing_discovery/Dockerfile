FROM ubuntu:16.04
# Dockerfile to run a self-hosted Syncthing discovery server (latest build).
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ADD https://build2.syncthing.net/guestAuth/app/rest/builds/id:16907/artifacts/content/stdiscosrv-linux-amd64-v0.14.44-rc.2+29-g8a3e584.tar.gz /stdiscosrv.tar.gz
COPY cert.pem key.pem /
RUN tar -xzf stdiscosrv.tar.gz && \
    rm stdiscosrv.tar.gz && \
    mv stdiscosrv* stdiscosrv && \
    mv /cert.pem /key.pem stdiscosrv/ && \
    useradd --no-create-home -g users --uid 22000 syncthing && \
    chown -R syncthing: /stdiscosrv && \
    mkdir /var/stdiscosrv && \
    chown syncthing: /var/stdiscosrv

USER syncthing
WORKDIR /stdiscosrv

ENTRYPOINT ["./stdiscosrv"]
