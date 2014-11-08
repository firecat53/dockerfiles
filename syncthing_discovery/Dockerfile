FROM ubuntu:trusty
# Dockerfile to run a self-hosted Syncthing discovery server.
MAINTAINER Scott Hansen <firecat4153@gmail.com>

ADD http://build.syncthing.net/job/discosrv/lastSuccessfulBuild/artifact/discosrv-linux-amd64.tar.gz /discosrv.tar.gz
RUN tar -xzvf discosrv.tar.gz && rm discosrv.tar.gz
RUN useradd --no-create-home -g users --uid 22000 syncthing
RUN mkdir /var/discosrv && chown syncthing: /var/discosrv

USER syncthing

ENTRYPOINT ["/discosrv/discosrv"]
