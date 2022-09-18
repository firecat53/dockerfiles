FROM alpine:3.12
LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

RUN apk --no-cache add python2 \
                       unzip \
                       wget && \
    wget -q https://github.com/rembo10/headphones/archive/master.zip -O /master.zip && \
    unzip master.zip && \
    rm master.zip && \
    adduser -DH headphones && \
    mkdir /config && \
    chown -R headphones:users /config && \
    apk del unzip wget

EXPOSE 8181

USER headphones
CMD ["python2", "headphones-master/Headphones.py", "--datadir", "/config", "--host", "0.0.0.0"]
