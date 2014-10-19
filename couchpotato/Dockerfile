FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update && apt-get install -qy git-core python

RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

RUN useradd --no-create-home -g users --uid 22000 couchpotato
USER couchpotato

CMD ["/start.sh"]
