FROM alpine:3.12

LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

RUN apk --no-cache add python3 \
                       unzip \
                       wget && \
    wget -q https://gitlab.com/LazyLibrarian/LazyLibrarian/-/archive/master/LazyLibrarian-master.zip -O /master.zip && \
    unzip master.zip && \
    rm master.zip && \
    # Prevents attempts at updating or checking git version
    sed -i 's/^LAZY.*/LAZYLIBRARIAN_VERSION = "Package"/' LazyLibrarian-master/lazylibrarian/version.py && \
    adduser -DH lazy && \
    mkdir -p /config && \
    chown -R lazy:users /config /LazyLibrarian-master/ && \
    apk del unzip wget

EXPOSE 5299

USER lazy
VOLUME ["/config"]

CMD ["python3", "LazyLibrarian-master/LazyLibrarian.py", "--datadir=/config"]
