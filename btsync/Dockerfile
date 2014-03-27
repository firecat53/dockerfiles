FROM ubuntu:precise

MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN apt-get update && apt-get install -qy unzip
ADD http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable /btsync.tar.gz
RUN tar -xzvf btsync.tar.gz && rm btsync.tar.gz

ADD https://github.com/jpetazzo/pipework/archive/master.zip /pipework.zip
RUN unzip pipework.zip && rm pipework.zip && cp pipework-master/pipework /usr/bin/pipework && chmod u+x /usr/bin/pipework

#ADD ./btsync.conf /btsync.conf
ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

CMD ["/start.sh"]

