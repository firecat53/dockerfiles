FROM ubuntu:16.04

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV LAZYLIBRARIAN_USER lazylibrarian
ENV UID 22000

RUN apt-get update -q && \
    apt-get install -qy unzip \
                        python \
                        wget && \
    wget https://github.com/itsmegb/LazyLibrarian/archive/master.zip -O /master.zip && \
    unzip master.zip && \
    rm master.zip && \
    useradd --no-create-home -g users --uid $UID $LAZYLIBRARIAN_USER && \
    apt-get autoremove -qy unzip wget && \
    rm -rf /var/lib/apt/lists/*

USER $LAZYLIBRARIAN_USER

CMD ["python", "LazyLibrarian-master/LazyLibrarian.py", "--nolaunch", "--datadir", "/config"]

