FROM alpine:3.12

LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

RUN apk --no-cache add git \
                       python2 \
                       py2-lxml && \
    git clone https://github.com/RuudBurger/CouchPotatoServer.git /couchpotato && \
    adduser -DH couchpotato && \
    mkdir /config && \
    chown -R couchpotato:users /config /couchpotato && \
    apk del git

USER couchpotato
VOLUME /config
WORKDIR /couchpotato

CMD ["./CouchPotato.py", "--data_dir", "/config"]
