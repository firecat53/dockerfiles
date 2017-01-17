FROM ubuntu:16.04
# Dockerfile to run a self-hosted Syncthing discovery server (latest build).
MAINTAINER Scott Hansen <firecat4153@gmail.com>

ADD https://build.syncthing.net/job/stdiscosrv/2074/artifact/stdiscosrv-linux-amd64-v0.14.19+3-gf36f00e.tar.gz /stdiscosrv.tar.gz
COPY cert.pem key.pem /
RUN tar -xzvf stdiscosrv.tar.gz && \
    rm stdiscosrv.tar.gz && \
    mv stdiscosrv* stdiscosrv && \
    mv /cert.pem /key.pem stdiscosrv/ && \
    useradd --no-create-home -g users --uid 22000 syncthing && \
    chown syncthing: /stdiscosrv/*pem && \
    mkdir /var/stdiscosrv && \
    chown syncthing: /var/stdiscosrv

USER syncthing
WORKDIR /stdiscosrv

ENTRYPOINT ["./stdiscosrv"]
