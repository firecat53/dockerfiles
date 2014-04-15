Docker Mysql
============

This is a Dockerfile to set up MySql as a master or slave. Thanks to https://github.com/cpuguy83/docker-mysql.

Build
-----

Rename either my.cnf.master or my.cnf.slave to my.cnf before building, and set server-id in my.cnf then::

	docker build --rm -t mysql . 

Create data-only volume::

    docker run -v /var/lib/mysql --name mysql_data busybox /bin/true

Configure
---------

1. Slave (first run)

You'll need to pass in envvars for MASTER_LOG_FILE and MASTER_LOG_POSITION and
MASTER_TCP_ADDR. These will be updated in the database and a flag set so they
won't be changed again after the first run. ::

	docker run -d --volumes-from mysql_data -p 3306:3306 --name mysql_slave \
        -e "MASTER_LOG_FILE=mysql-bin.000746" \
        -e "MASTER_LOG_POSITION=1025595195" \
        -e "MASTER_TCP_ADDR=logocompany.dyndns.biz" \
        mysql

Run
___

Running the container (master)::

	docker run -d --volumes-from mysql_data -p 5001:5001 --name mysql_master mysql

Running the container (slave)::

	docker run -d --volumes-from mysql_data -p 3306:3306 --name mysql_slave mysql

Manage
------

To view logs or look at the /var/lib/mysql directory use the mysql_client image (or just ubuntu image if you don't need mysql-client::

    docker run -i -t --volumes-from mysql_data mysql_client /bin/bash

TODO
----

Switch to using SSH tunnel for mysql replication.
