# Docker Miniflux

This is a Dockerfile to set up [Miniflux][1].

## Build

The most recent release will be built from source.

## Run

### First Run

1. Initialize Postgres database and set Miniflux initial user/password

        ./initialze.sh
                   
2. Run Postgres (note: user, password and database are all `miniflux`)

        docker run --rm \
                   -d \
                   --user postgres:postgres \
                   --name postgres_run \
                   --network miniflux \
                   -v miniflux_data:/var/lib/postgresql/data \
                   postgres:alpine

3. Start miniflux (note: initial user and password `miniflux`)

        docker run --rm \
                   -d \
                   --name miniflux_run \
                   --network miniflux \
                   -e DATABASE_URL="user=miniflux password=miniflux dbname=miniflux sslmode=disable host=postgres_run" \
                   miniflux
                   
4. Visit https://localhost:8080 , login, and change password (and username, if desired)
5. Add configuration options using environment variables (like `DATABASE_URL`
   above) or add a data volume containing `miniflux.conf` (chown to `nobody`
   user) and start miniflux with the `-config-file` option. Example:
   
        docker run --rm \
                   -d \
                   --name miniflux_run \
                   --network miniflux \
                   -e DATABASE_URL="user=miniflux password=miniflux dbname=miniflux sslmode=disable host=postgres_run" \
                   -v miniflux_config:/config \
                   miniflux \
                   -config-file /config/miniflux.conf

6. If using a reverse proxy container in front of miniflux, add
   `--network=<default docker network name>` in addition to `--network miniflux`
   to the miniflux container to ensure it is also in the proxy's network.
                   
[1]: https://miniflux.app
