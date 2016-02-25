FROM ubuntu:trusty
# Dockerfile to run a self-hosted Syncthing discovery server (latest build).
MAINTAINER Scott Hansen <firecat4153@gmail.com>

ADD http://build.syncthing.net/job/discosrv/lastSuccessfulBuild/artifact/discosrv-linux-amd64.tar.gz /discosrv.tar.gz
RUN tar -xzvf discosrv.tar.gz && rm discosrv.tar.gz && mv discosrv* discosrv
ADD cert.pem /discosrv/
ADD key.pem /discosrv/
RUN useradd --no-create-home -g users --uid 22000 syncthing
RUN chown syncthing: /discosrv/*pem && mkdir /var/discosrv && chown syncthing: /var/discosrv

USER syncthing
WORKDIR /discosrv

ENTRYPOINT ["./discosrv"]
