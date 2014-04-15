Docker Mysql-Client
===================

This is a Dockerfile to set up mysql-client for working on a database.

Build
-----

	docker build -rm -t mysql-client . 

Run
___

Running the container::

	docker run -i -t -p 3306:3306 mysql-client /usr/bin/mysql -u usapparel -pinventory usapparel_inventory
