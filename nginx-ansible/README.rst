* This creates the files and builds a Docker container for nginx. You first need to edit the variables in vars/main.yml and vars/secret.yml for the sites you need. You only need to add sites that need Basic Auth or Reverse Proxy. Any normal sites should be picked up just fine (except for any php sites needing fcgi or similar...that's not implemented yet.)

  - secret.yml::

      hostname: <server ip address>
      htpasswd_users:
        - name: <user1>
          password: <password1>
        - name: <user2>
          password: <password2>

* Plex and transmission are not managed with this, because they don't work quite the same way (transmission has it's own IP address outside docker, and plex seems to need a 'normal' <url>:<port> to be able to talk to plex.tv).
