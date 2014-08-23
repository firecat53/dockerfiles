FROM ubuntu:trusty

RUN apt-get update -q && apt-get install -qy curl build-essential golang git

ENV GOPATH /go

RUN go get github.com/docker/libcontainer/nsinit

CMD ["/bin/true"]
