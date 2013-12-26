#!/bin/bash

# configure apt
echo "Installing the Docker GPG key for apt"
wget -qO- https://get.docker.io/gpg | apt-key add -
# add the docker key and repos, and install docker
echo "Adding the Docker apt source"
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
echo "Running apt-get update"
apt-get update
echo "Installing docker"
apt-get install -y lxc-docker git
echo "Done"