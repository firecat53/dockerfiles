FROM ubuntu:16.04
# Dockerfile to run Syncthing. Requires an external container manager such as
# systemd to auto-restart the container when Syncthing restarts.
MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV SYNCTHING_USER syncthing
ENV UID 22000

COPY start.sh /

RUN apt-get update -q && \
    apt-get install -qy \
        ca-certificates \
        wget && \
    wget https://github.com/syncthing/syncthing/releases/download/v0.14.28/syncthing-linux-amd64-v0.14.28.tar.gz -O /syncthing.tar.gz && \
    tar -xzvf syncthing.tar.gz && \
    mv sync*/syncthing /syncthing && \
    rm -rf syncthing.tar.gz syncthing-linux* && \
    chmod +x /start.sh && \
    useradd --no-create-home -g users --uid $UID $SYNCTHING_USER && \
    apt-get autoremove -qy wget && \
    rm -rf /var/lib/apt/lists/*

USER $SYNCTHING_USER

CMD ["/start.sh"]
