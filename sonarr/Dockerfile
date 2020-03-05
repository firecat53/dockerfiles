FROM ubuntu
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG uid=1000
ARG gid=100
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -qy gnupg software-properties-common && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xA236C58F409091A18ACA53CBEBFF6B99D9B78493 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb http://apt.sonarr.tv/ master main" | tee /etc/apt/sources.list.d/sonarr.list && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && \
    apt-get install -qy nzbdrone && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    useradd --no-create-home -g users -u $uid sonarr && \
    mkdir /config && \
    chown -R sonarr:users /config && \
    apt-get autoremove -qy gnupg software-properties-common && \
    rm -rf /var/lib/apt/lists

EXPOSE 8989
USER sonarr
VOLUME ["/config", "/data"]

CMD ["mono", "--debug", "/opt/NzbDrone/NzbDrone.exe", "-nobrowser", "-data=/config"]
