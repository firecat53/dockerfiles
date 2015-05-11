FROM ubuntu:trusty

MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV LAZYLIBRARIAN_USER lazylibrarian
ENV UID 22000

RUN apt-get update && apt-get install -qy unzip python
ADD https://github.com/itsmegb/LazyLibrarian/archive/master.zip /master.zip
RUN unzip master.zip && rm master.zip

RUN useradd --no-create-home -g users --uid $UID $LAZYLIBRARIAN_USER
USER $LAZYLIBRARIAN_USER

CMD ["python", "LazyLibrarian-master/LazyLibrarian.py", "--nolaunch", "--datadir", "/config"]

