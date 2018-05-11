FROM alpine

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

RUN apk --no-cache add git python2 py2-lxml shadow && \
    git clone https://github.com/RuudBurger/CouchPotatoServer.git /usr/local/src/couchpotato && \
    useradd --no-create-home --uid 22000 couchpotato && \
    chown -R couchpotato:users /usr/local/src/couchpotato && \
    apk del git shadow

USER couchpotato
VOLUME /config
WORKDIR /usr/local/src/couchpotato

CMD ["./CouchPotato.py", "--data_dir", "/config"]
