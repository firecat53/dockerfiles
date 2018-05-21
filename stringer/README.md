# Stringer

This is a Dockerfile to set up the Stringer RSS reader. Feeds will be updated
every 10 min and old stories cleaned up once a month. This setup uses an sqlite
database instead of the default postgres database.

## Build

    docker build -t stringer .

Create a data-only volume for saving the stringer sqlite database:

    docker create -v /data --name stringer_data myscratch true
    docker run --rm --volumes-from stringer_data --user root stringer chown -R stringer:stringer /data

## Run

    # docker run -d -p 8080:8080 \
        --volumes-from stringer_data \
        --name stringer_run \
        stringer

Systemd service file is available.
