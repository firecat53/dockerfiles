FROM ubuntu:precise

MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN apt-get update && apt-get install -qy unzip
ADD https://github.com/itsmegb/LazyLibrarian/archive/master.zip /master.zip
RUN unzip master.zip && rm master.zip

EXPOSE 5299

CMD ["python", "LazyLibrarian-master/LazyLibrarian.py", "--nolaunch", "--datadir", "/config"]

