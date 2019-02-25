#!/bin/bash

set -euox pipefail
IFS=$'\n\t'

DEBIAN_VERSION=$(source /etc/os-release ; VERSION="${VERSION#*(}" ; echo "${VERSION%)*}" )
export INITRD="no"
export DEBIAN_FRONTEND="noninteractive"
export DEBCONF_NONINTERACTIVE_SEEN="true"
export LC_ALL="C"
export LANGUAGE="C"
export LANG="C"

apt-get update
apt-get -y upgrade
apt-get -y install curl

DOCKER_FILE_NAME=$(curl --fail --silent --location https://download.docker.com/linux/static/stable/x86_64/ | grep -Po '<a.*>\Kdocker-.*\.tgz(?=</a>)' | tail -1)
curl --fail --silent --location --output "/tmp/$DOCKER_FILE_NAME" "https://download.docker.com/linux/static/stable/x86_64/$DOCKER_FILE_NAME"
tar --extract --file "/tmp/$DOCKER_FILE_NAME" --strip-components 1 --directory /usr/local/bin/

docker --version

COMPOSE_VERSION=$(curl --fail --silent --show-error --location --silent https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
curl --fail --silent --show-error --location --output /tmp/docker-compose "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-Linux-x86_64"
chmod +x /tmp/docker-compose
mv --force /tmp/docker-compose /usr/local/bin/docker-compose

docker-compose -v

apt-get -y clean
apt-get -y autoremove
apt-get -y autoclean

rm --recursive --force /tmp/* /var/lib/{apt,cache,log}/ /var/log/* /usr/share/{doc,man,groff,info,lintian,linda} /var/cache/man/*
