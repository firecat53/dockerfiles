Nginx Dockerfile
================

Dockerfile to build nginx from the latest ubuntu PPA, configured with Ansible.

Configure
---------

You could create a data-only container to host the served informationa (/srv/http/) or just mount directories on the host server.
Ansible will take care of configuring the vhosts, server configuration and SSL certificates/htpasswd.

Build
-----

::

    docker build --rm -t nginx .

Run
---

::

    docker run -d -p 80:80 -p 443:443 -v /srv/http:/srv/http --name nginx_run nginx
