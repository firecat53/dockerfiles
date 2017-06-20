FROM ubuntu:16.04

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ENV COUCHPOTATO_USER couchpotato
ENV UID 22000

COPY ./start.sh /start.sh

RUN apt-get -q update && \
    apt-get install -qy git-core python && \
    git clone https://github.com/RuudBurger/CouchPotatoServer.git && \
    chmod u+x /start.sh && \
    useradd --no-create-home -g users --uid $UID $COUCHPOTATO_USER && \
    apt-get autoremove -qy git-core && \
    rm -rf /var/lib/apt/lists/*

USER $COUCHPOTATO_USER

CMD ["/start.sh"]
