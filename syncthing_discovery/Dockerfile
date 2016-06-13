FROM ubuntu:16.04
# Dockerfile to run a self-hosted Syncthing discovery server (latest build).
MAINTAINER Scott Hansen <firecat4153@gmail.com>

ADD https://build.syncthing.net/job/discosrv/lastSuccessfulBuild/artifact/discosrv-linux-amd64-v0.13.6.tar.gz /discosrv.tar.gz
COPY cert.pem key.pem /
RUN tar -xzvf discosrv.tar.gz && \
    rm discosrv.tar.gz && \
    mv discosrv* discosrv && \
    mv /cert.pem /key.pem discosrv/ && \
    useradd --no-create-home -g users --uid 22000 syncthing && \
    chown syncthing: /discosrv/*pem && \
    mkdir /var/discosrv && \
    chown syncthing: /var/discosrv

USER syncthing
WORKDIR /discosrv

ENTRYPOINT ["./discosrv"]
