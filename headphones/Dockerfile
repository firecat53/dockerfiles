FROM ubuntu:16.04
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ENV HEADPHONES_USER headphones
ENV UID 22000

COPY start.sh /start.sh
RUN apt-get update -q && \
    apt-get install -qy git-core \
                        python \
                        ca-certificates && \
    git clone https://github.com/rembo10/headphones && \
    useradd --no-create-home -g users --uid $UID $HEADPHONES_USER && \
    mv /start.sh /headphones/start.sh && \
    chmod +x /headphones/start.sh && \
    rm -rf /var/lib/apt/lists/*

USER $HEADPHONES_USER
WORKDIR /headphones

CMD ["./start.sh"]
