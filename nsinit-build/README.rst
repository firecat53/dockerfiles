Build nsinit binary
===================

This is a Dockerfile to compile the nsinit binary without having to install the Golang development environment on your own machine. If you already have Go installed on your host you can just::

    go get github.com/docker/libcontainer/nsinit

and nsinit will be installed to $GOPATH/bin

Build
-----

Builds and runs::

	./build.sh

The nsinit binary will be compiled and copied to this directory (dockerfiles/nsinit-build/). Copy or link into someplace in your $PATH.

Cleanup
-------

    docker rm nsinit_run
    docker rmi nsinit
