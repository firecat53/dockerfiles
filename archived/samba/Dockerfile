FROM alpine:3.18

LABEL "Maintainer"="Scott Hansen <tech@firecat53.net>"

RUN apk --no-cache add samba-common-tools \
                       samba-server \
                       shadow \
                       s6 && \
    mkdir -p /etc/s6/samba && \
    mkdir /etc/s6/nmbd && \
    ln -s /bin/true /etc/s6/samba/finish && \
    ln -s /bin/true /etc/s6/nmbd/finish

COPY samba.start /etc/s6/samba/run
COPY nmbd.start /etc/s6/nmbd/run

ENTRYPOINT ["s6-svscan", "/etc/s6"]
