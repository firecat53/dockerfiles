FROM ubuntu
LABEL "Maintainer"="Scott Hansen <firecat4153@gmail.com>"

ARG uid=1000
ARG gid=100
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -qy curl gnupg ca-certificates mediainfo && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" > \
        /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && \
    apt-get -qy install libmono-cil-dev && \
    cd /opt && \
    curl -L -O $(curl -s https://api.github.com/repos/Radarr/Radarr/releases | \
        grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4) && \
    tar -xvzf Radarr.develop.*.linux.tar.gz && \
    rm Radarr.*gz && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            sed -i "s/users:x:[0-9]\+:/users:x:$gid:/" /etc/group && \
    useradd --no-create-home -g users -u $uid radarr && \
    mkdir /config && \
    chown -R radarr:users /config /opt/Radarr && \
    apt-get autoremove -qy gnupg && \
    rm -rf /var/lib/apt/lists

EXPOSE 7878
USER radarr
VOLUME ["/config"]

CMD ["mono", "/opt/Radarr/Radarr.exe", "-nobrowser", "-data=/config"]
