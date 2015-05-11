FROM ubuntu:trusty
MAINTAINER Scott Hansen <firecat4153@gmail.com>

ENV HEADPHONES_USER
ENV UID

RUN apt-get update && apt-get install -qy git-core python ca-certificates
RUN git clone https://github.com/rembo10/headphones

RUN useradd --no-create-home -g users --uid $UID $HEADPHONES_USER
USER $HEADPHONES_USER
WORKDIR /headphones

CMD ["python", "Headphones.py", "--datadir", "/data", "--nolaunch"]
