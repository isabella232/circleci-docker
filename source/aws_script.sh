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

apt-get -y install python python-pip
pip install awscli --upgrade --user
mv --force ~/.local/bin/aws* /usr/local/bin/

apt-get -y clean
apt-get -y autoremove
apt-get -y autoclean

rm --recursive --force /tmp/* /var/lib/{apt,cache,log}/ /var/log/* /usr/share/{doc,man,groff,info,lintian,linda} /var/cache/man/*
