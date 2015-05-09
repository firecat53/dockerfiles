Docker Stringer
===============

This is a Dockerfile to set up the Stringer RSS reader. Feeds will be updated
every 10 min and old stories cleaned up every 30 days (values can be adjusted in
schedule.rb). This setup uses an Sqlite database instead of the default
postgres database.

Thanks to: https://github.com/antonlindstrom/stringer-docker

Build
-----

::

    # docker build -t stringer .

Setup
-----

Create a data-only volume for saving the stringer sqlite database. This also creates the sqlite database::

    # docker run -it -v /stringer/data --name stringer_data stringer bundle exec rake db:migrate

Run
---

::

    # docker run -d -p 5000:5000 \
        --volumes-from stringer_data \
        --name stringer_run \
        stringer

Systemd service file is available.
