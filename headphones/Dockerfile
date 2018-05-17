FROM alpine
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

RUN apk --no-cache add python \
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
CMD ["python", "headphones-master/Headphones.py", "--datadir", "/config", "--host", "0.0.0.0"]
