# Adds and configures:
#  openssh-server - configures passwordless key access and allows SSH access from host machine only
#  Add deployment user 'ansible'. 
  
FROM ubuntu:trusty

MAINTAINER Scott Hansen firecat4153@gmail.com

ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN apt-get update && apt-get -qy install openssh-server sudo python python-apt aptitude

# Create deployment user
RUN groupadd wheel
RUN adduser --disabled-login --ingroup wheel ansible
RUN echo "ansible:ansible-master" | chpasswd
ADD docker_rsa.pub /home/ansible/.ssh/authorized_keys
RUN chmod 700 /home/ansible/.ssh && chmod 400 /home/ansible/.ssh/authorized_keys && chown -R ansible:wheel /home/ansible/.ssh
RUN echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/ansible && chmod 440 /etc/sudoers.d/ansible

# Configure SSH
RUN mkdir -p -m0755 /var/run/sshd
ADD sshd_config /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
