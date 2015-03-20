FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN apt-get update && apt-get install -qy unzip
RUN useradd --no-create-home -g users --uid 22000 btsync
ADD https://download-cdn.getsyncapp.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz /btsync.tar.gz
RUN tar -xzvf btsync.tar.gz && rm btsync.tar.gz

USER btsync

CMD ["/btsync", "--nodaemon", "--log", "file", "--webui.listen", "0.0.0.0:8888"]
