FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV COUCHPOTATO_USER couchpotato
ENV UID 22000

RUN apt-get -q update && apt-get install -qy git-core python

RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git

COPY ./start.sh /start.sh
RUN chmod u+x /start.sh

RUN useradd --no-create-home -g users --uid $UID $COUCHPOTATO_USER
USER $COUCHPOTATO_USER

CMD ["/start.sh"]
