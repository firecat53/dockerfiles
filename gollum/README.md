# Docker Gollum

This is a Dockerfile to set up the [Gollum][1] personal wiki.

## Build

Uncomment lines for any additional desired markup flavors to support in the
Dockerfile.

Default uid and gid are 1000:100. Configure your uid/gid using `--build-arg`.

    docker build --build-arg=uid=$(id -u) --build-arg=gid=$(id -g) -t gollum .

## Run

Systemd service file is also available (edit paths first). Any
additional arguments to Gollum can be added after the image name in the docker
run line. If you have an existing .gitconfig, you can bind-mount it into the
container to add your username to the git commit history (otherwise it shows up
as 'Anonymous')::

    docker run -d \
               -p 4567:4567 \
               -v /path/to/wiki:/home/gollum/wiki \
               -v /home/<user>/.gitconfig:/home/gollum/.gitconfig:ro \
               -v /etc/localtime:/etc/localtime:ro \
               --name gollum_run \
               gollum \
               --allow-uploads page \
               --show-all

If you make changes to the wiki on the host machine, the changes won't
be visible in Gollum until they are committed to the repository.

[1]: https://github.com/gollum/gollum "Gollum"
