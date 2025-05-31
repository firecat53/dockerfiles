# Docker media tools

Simple Dockerfile to install several media file tools that can be used with
mounted media volumes or directories. The image is built with the default uid
and gid of 1000:100, which can be altered at build time with the `--build-arg`
arguments shown below.

* handbrake-cli
* mediainfo
* par2
* mediainfo
* ranger (for easy folder browsing)
* rsync
* unrar (nonfree)

## Build

    docker build --build-arg uid=$(id -u) --build-arg gid=$(id -g) -t media_tools .

## Usage

    docker run -it --rm -v /mnt/:/mnt media_tools
