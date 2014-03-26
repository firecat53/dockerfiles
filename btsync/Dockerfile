FROM ubuntu:precise

MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN apt-get update && apt-get install -y curl
RUN curl -o /usr/bin/btsync.tar.gz http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz

ADD private/btsync.conf /btsync.conf

CMD ["/start.sh"]

