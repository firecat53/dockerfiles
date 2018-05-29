FROM ubuntu

LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -qy software-properties-common && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
    echo "deb https://apt.sonarr.tv/ master main" | tee /etc/apt/sources.list.d/sonarr.list && \
    apt-get update && \
    apt-get install -qy nzbdrone && \
    useradd --no-create-home -g users sonarr && \
    mkdir /config && \
    chown -R sonarr:users /config && \
    apt-get autoremove -qy software-properties-common && \
    rm -rf /var/lib/apt/lists

EXPOSE 8989
USER sonarr
VOLUME /config

CMD ["mono", "--debug", "/opt/NzbDrone/NzbDrone.exe", "-nobrowser", "-data=/config"]
