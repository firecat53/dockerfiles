# Stringer

This is a Dockerfile to set up the Stringer RSS reader. Feeds will be updated
every 10 min and old stories cleaned up once a month. This setup uses an sqlite
database saved to a data volume `stringer_data` instead of the default postgres
database.

## Build

    docker build -t stringer .

## Run

    # docker run -d -p 8080:8080 \
        --mount type=volume,source=stringer_data,target=/data \
        --name stringer_run \
        stringer

Systemd service file is available.
