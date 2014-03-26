FROM ubuntu:precise

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update && apt-get install -qy git-core

RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git

VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

EXPOSE 5050

CMD ["/start.sh"]
