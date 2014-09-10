Nginx-ansible
=============

This Ansible playbook creates the files and builds a Docker container for nginx that will reverse proxy any given sites and provide Basic Authentication to any other non-reverse proxied sites that are given in the configuration.

Run
---

1. Edit the variables in host_vars/servername/* for the sites you need. There are templates provided for the vault-encrypted file. You only need to add sites that need Basic Auth or Reverse Proxy. Any normal sites should be picked up just fine (except for any php sites needing fcgi or similar...that's not implemented yet.)

2. Run the playbook. If you don't have script for producing the vault password, edit ansible.cfg and change 'vault_password_file =...' to 'ask_vault_pass = True'.

3. Run the playbook::

   ansible-playbook nginx.yml

Plex and Transmission are not managed with this playbook, because they are not reverse-proxied (Transmission has it's own IP address outside Docker, and Plex seems to need a 'normal' <url>:<port> to be able to talk to Plex.tv).
