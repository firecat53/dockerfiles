FROM ubuntu:16.04

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

COPY run.sh /run.sh
RUN apt-get update -q && \
    apt-get install -qy --no-install-recommends \
        samba-common-bin \
        samba && \
    chmod u+x /run.sh && \
    rm -rf /var/lib/apt/lists/*

CMD ["/run.sh"]
