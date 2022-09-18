FROM ubuntu:22.04

LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"
ARG uid=1000
ARG gid=100

RUN apt-get -q update && \
    apt-get install -qy \
                    handbrake-cli \
                    ffmpeg \
                    mediainfo \
                    mkvtoolnix \
                    par2 \
                    ranger \
                    rsync \
                    unrar \
                    vim-tiny && \
    # Change `users` gid to match the passed in $gid
    [ $(getent group users | cut -d: -f3) == $gid ] || \
            groupmod -g $gid users && \
    useradd --no-create-home -g users -u $uid media && \
    rm -rf /var/lib/apt/lists

USER media
ENTRYPOINT ["/bin/bash"]
