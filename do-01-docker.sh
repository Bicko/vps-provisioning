#!/bin/bash

# Running as root?
if [ "$(id -u)" != "0" ] ; then
  echo "Please run this as root." 1>&2
  exit 1
fi

# Must update repo list first!
apt update

#Install Ansible, if not already installed
test ! -f /usr/local/bin/ansible && apt -y install python3-pip && pip3 install ansible

apt-get update

#Install git, if not already installed
test ! -f /usr/bin/git && apt -y install git

#Get the repo, if not already present
cd ~
test ! -d vps-provisioning && git clone https://github.com/Bicko/vps-provisioning.git

#Get latest yaml, etc
cd vps-provisioning && git pull

ansible-playbook ~/vps-provisioning/do-01-docker.yml
