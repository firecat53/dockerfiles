Docker Ansible Base Image
=========================

This Dockerfile builds a base image that can be provisioned with Ansible. It establishes an 'ansible' user with sudo priviliges and sets up sshd with key based authentication.

Build
-----

Copy your public key to the root directory as docker_rsa.pub and edit sshd_config if necessary then::

    # docker build --rm -t ansible-base .

Run
---

::

    # docker run -d -p 22 --name ansible_test ansible-base

Then get the SSH IP address and port from::

    # docker inspect ansible-base | grep IPAddress
    # docker ps
