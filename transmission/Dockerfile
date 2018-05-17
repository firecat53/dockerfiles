FROM alpine
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

COPY settings.json /var/lib/transmission/
COPY start.sh /usr/local/bin/start.sh

VOLUME /config
VOLUME /data

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk --no-cache add curl \
                       transmission-cli \
                       transmission-daemon && \
    chown -R transmission:users /var/lib/transmission

USER transmission:users
CMD ["start.sh"]
