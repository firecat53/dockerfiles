* An assorted collection of Dockerfiles. Build/run instructions are in each subdirectory.
  
  - Ansible-base (base image to be able to provision via Ansible)
  - Btsync
  - Couchpotato
  - Headphones
  - Lazy Librarian
  - Nginx-ansible (Ansible playbook for semi-automatically setting up Nginx reverse proxy to the containers)
  - OMD (Open Monitoring Distribution. Pre-configured Nagios with Check_Mk plugin, et. al.)
  - Plex
  - Rdiff-backup (used for `backing up data-only volumes`_)
  - Sabnzbd
  - Shinken (Nagios-compatible server monitoring)
  - Sickbeard
  - Syncthing
  - Transmission (with OpenVPN client and privateinternetaccess.com script)

* The standard UID:GID for the containers that don't run as root is 22000:100. Make sure to update UID/GID as necessary if you have shared data and need it to be easily accessible between containers/host
* MIT License

.. _backing up data-only volumes: https://github.com/firecat53/docker-tools
