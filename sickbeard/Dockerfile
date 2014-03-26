FROM ubuntu:precise

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update && apt-get install -qy --force-yes git-core python-cheetah python-openssl

RUN git clone https://github.com/midgetspy/Sick-Beard.git sickbeard

VOLUME /data

EXPOSE 8081

CMD ["python", "sickbeard/SickBeard.py", "--datadir=/data"]
