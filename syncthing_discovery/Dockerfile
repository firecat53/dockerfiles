FROM ubuntu:16.04
# Dockerfile to run a self-hosted Syncthing discovery server (latest build).
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ADD https://build.syncthing.net/job/stdiscosrv/2390/artifact/stdiscosrv-linux-amd64-v0.14.30-rc.1+9-gd637148.tar.gz /stdiscosrv.tar.gz
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
