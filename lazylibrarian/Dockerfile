FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN apt-get update && apt-get install -qy unzip python
ADD https://github.com/itsmegb/LazyLibrarian/archive/master.zip /master.zip
RUN unzip master.zip && rm master.zip

RUN useradd --no-create-home -g users --uid 22000 lazylibrarian
USER lazylibrarian

CMD ["python", "LazyLibrarian-master/LazyLibrarian.py", "--nolaunch", "--datadir", "/config"]

