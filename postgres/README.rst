Docker PostgreSQL
==================

This is a placeholder with a systemd service file for a Postgres database container. It just uses the stock 'postgres' image and an environment variable POSTGRES_PASSWORD to setup postgres for the default user 'postgres'. See the `Docker documentation`_ for more info and options.

Initialize
----------

Set your administrator password for the 'postgres' user in either ./postgres_password (if running from this directory) or $HOME/.postgres_password (if running from an init script), or set the POSTGRES_PASSWORD env variable.

Running the systemd service file will automatically run the postgres_init script to initialize the database if it doesn't already exist.

If not using the systemd service file, run postgres_init to initialize the database and the data-only volume ``postgres_data``::

    # ./postgres_init

Run
---

::

    # docker run -d --volumes-from postgres_data --name postgres_run postgres

Systemd service file is available.

Manage
------

The default database password for the 'postgres' user are found in postgres_password. To access/manage the postgres database command line (with the postgres_run container already running), set the POSTGRES_PASSWORD env variable (or don't set it and leave out the -e option from docker run to enter the password manually) and then::

    # docker run -it --rm -e PGPASSWORD=$POSTGRES_PASSWORD --link postgres_run:postgres <your image name> sh -c 'psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'

.. _Docker documentation: https://github.com/docker-library/docs/tree/master/postgres
