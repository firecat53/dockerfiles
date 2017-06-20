FROM ubuntu:16.04

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV SICKBEARD_USER sickbeard
ENV UID 22000

RUN apt-get -q update && \
    apt-get install -qy \
        git-core \
        python-cheetah \
        python-openssl && \
    git clone https://github.com/midgetspy/Sick-Beard.git sickbeard && \
    useradd --no-create-home -g users --uid $UID $SICKBEARD_USER && \
    rm -rf /var/lib/apt/lists/*

USER $SICKBEARD_USER

CMD ["python", "sickbeard/SickBeard.py", "--datadir=/data"]
