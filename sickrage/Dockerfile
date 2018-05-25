FROM alpine

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

RUN apk --no-cache add build-base \
                       ca-certificates \
                       linux-headers \
                       py2-openssl \
                       py2-pip \
                       python-dev && \
    pip --no-cache-dir install --upgrade sickrage && \
    adduser -HD sickrage && \
    mkdir /config && \
    chown -R sickrage:users /config && \
    apk del build-base linux-headers python-dev

EXPOSE 8081

USER sickrage

VOLUME ["/config"]

CMD ["sickrage", "--datadir", "/config"]
