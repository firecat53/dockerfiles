# Traefik (uses official Traefik image)

* Add additional services either in traefik.toml or dynamically using
  [Docker labels](https://docs.traefik.io/user-guide/docker-and-lets-encrypt/#labels)
* Runs the traefik admin dashboard.
* Docker volume `traefik_config` contains acme.json and traefik.toml. Mount to
  /etc/traefik so the traefik binary will locate the configuration file.

## Configure

* Edit traefik.toml: update hostname and basic auth info.
* Create a volume and copy the config file into it:

        docker volume create traefik_config
        docker run --rm \
                   -v traefik_config:/etc/traefik \
                   -v $(pwd):/mnt \
                   alpine \
                   sh -c "cp -a /mnt/traefik.toml /etc/traefik/ && touch /etc/traefik/acme.json"

* Update your desired dashboard hostname in the `docker run` command below.

## Run

    docker run -d \
               -p 80:80 \
               -p 443:443 \
               -v /var/run/docker.sock:/var/run/docker.sock \
               -v traefik_config:/etc/traefik \
               -v /etc/localtime:/etc/localtime:ro \
               -l traefik.frontend.rule=Host:monitor.myhost.local \
               -l traefik.backend=traefik_run \
               -l traefik.port=8080 \
               --name=traefik_run \
               traefik:alpine \
               --docker
