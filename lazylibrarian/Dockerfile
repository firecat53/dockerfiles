FROM alpine

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

RUN apk --no-cache add python3 \
                       unzip \
                       wget && \
    wget -q https://github.com/dobytang/LazyLibrarian/archive/master.zip -O /master.zip && \
    unzip master.zip && \
    rm master.zip && \
    # Prevents attempts at updating or checking git version
    sed -i 's/^LAZY.*/LAZYLIBRARIAN_VERSION = "Package"/' LazyLibrarian-master/lazylibrarian/version.py && \
    adduser -DH lazy && \
    mkdir -p /config && \
    chown -R lazy:users /config /LazyLibrarian-master/ && \
    apk del unzip wget

EXPOSE 5299
VOLUME ["/config"]

USER lazy
CMD ["python3", "LazyLibrarian-master/LazyLibrarian.py", "--datadir=/config"]
