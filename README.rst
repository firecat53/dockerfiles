* An assorted collection of Dockerfiles. Build/run instructions are in each subdirectory.
  
  - Ansible-base (base image to be able to provision via Ansible)
  - Btsync
  - Couchpotato
  - Lazy Librarian
  - Nginx-ansible (Ansible playbook for semi-automatically setting up Nginx reverse proxy to the containers)
  - Nsinit-build (compiles nsinit binary without locally installed golang environment)
  - Plex
  - Rdiff-backup (used for `backing up data-only volumes`_)
  - Sabnzbd
  - Sickbeard
  - Syncthing
  - Transmission (with OpenVPN client and privateinternetaccess.com script)

* An additional tool for troubleshooting Docker containers is `docker-enter`_. 
* MIT License

.. _backing up data-only volumes: https://gist.github.com/firecat53/9674578
.. _docker-enter: https://github.com/firecat53/docker-enter
