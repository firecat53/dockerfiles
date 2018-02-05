FROM ubuntu:16.04

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ENV LAZYLIBRARIAN_USER lazylibrarian
ENV UID 22000

RUN apt-get update -q && \
    apt-get install -qy unzip \
                        python \
                        wget && \
    wget https://github.com/dobytang/LazyLibrarian/archive/master.zip -O /master.zip && \
    unzip master.zip && \
    rm master.zip && \
    useradd --no-create-home -g users --uid $UID $LAZYLIBRARIAN_USER && \
    chown -R $LAZYLIBRARIAN_USER LazyLibrarian-master && \
    apt-get autoremove -qy unzip wget && \
    rm -rf /var/lib/apt/lists/*

USER $LAZYLIBRARIAN_USER

CMD ["python", "LazyLibrarian-master/LazyLibrarian.py", "--nolaunch", "--datadir", "/config"]
