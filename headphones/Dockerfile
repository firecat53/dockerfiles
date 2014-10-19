FROM ubuntu:trusty
MAINTAINER Scott Hansen <firecat4153@gmail.com>

RUN apt-get update && apt-get install -qy git-core python ca-certificates
RUN git clone https://github.com/rembo10/headphones

RUN useradd --no-create-home -g users --uid 22000 headphones
USER headphones
WORKDIR /headphones

CMD ["python", "Headphones.py", "--datadir", "/data", "--nolaunch"]
