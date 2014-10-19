FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update && apt-get install -qy --force-yes git-core python-cheetah python-openssl

RUN git clone https://github.com/midgetspy/Sick-Beard.git sickbeard

RUN useradd --no-create-home -g users --uid 22000 sickbeard
USER sickbeard

CMD ["python", "sickbeard/SickBeard.py", "--datadir=/data"]
