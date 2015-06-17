FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends samba-common-bin samba

ADD run.sh /run.sh
RUN chmod u+x /run.sh

CMD ["/run.sh"]
