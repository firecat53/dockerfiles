Docker Ansible Base Image
=========================

.. attention::

    THIS DOCKERFILE IS DEPRECATED. I'll leave it here in case someone has a use case for it, but the typical method of provisioning a container is via creating a Dockerfile, not with configuration management. There should rarely be a need to have an SSH daemon running in a container. After Docker v1.3, the `docker exec` command is available to access a running container if necessary.


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

    # docker inspect ansible_test | grep IPAddress
    # docker ps
