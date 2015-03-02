Docker Stringer
===============

This is a Dockerfile to set up the Stringer RSS reader. Feeds will be updated every 10 min and old stories cleaned up every 30 days (values can be adjusted in schedule.rb)

Thanks to: https://github.com/antonlindstrom/stringer-docker

Build
-----

::

    # docker build -t stringer .

Setup
-----

Set the database password in ``stringer_init``. To initialize the database, run::

    # ./stringer_init

Running stringer_init manually is unnecessary if starting stringer with the systemd service file.

Run
---

::

    # docker run -d --volumes-from postgres_data --name postgres_run postgres:latest
    # docker run -d -p 5000:5000 \
        --link postgres_run:postgres \
        --name stringer_run \
        -e STRINGER_DATABASE_PASSWORD=<pw from stringer_init> \
        stringer

Systemd service file is available.

Manage
------

The Stringer database password is found in stringer_init.  To manage the Stringer database (with the postgres_run container already running)::

    # docker run -it --rm --link postgres_run:postgres postgres sh -c 'psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -d stringerdb -U stringer'
    # <enter stringerdb password>
