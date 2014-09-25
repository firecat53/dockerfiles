FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN apt-get update && apt-get install -qy unzip
ADD http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable /btsync.tar.gz
RUN tar -xzvf btsync.tar.gz && rm btsync.tar.gz

CMD ["/btsync", "--nodaemon", "--log", "file", "--webui.listen", "0.0.0.0:8888"]
