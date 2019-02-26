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

cat > /etc/apt/sources.list <<EOF
deb http://deb.debian.org/debian $DEBIAN_VERSION main contrib non-free
deb-src http://deb.debian.org/debian $DEBIAN_VERSION main contrib non-free
deb http://deb.debian.org/debian/ $DEBIAN_VERSION-updates main contrib non-free
deb-src http://deb.debian.org/debian/ $DEBIAN_VERSION-updates main contrib non-free
deb http://deb.debian.org/debian-security $DEBIAN_VERSION/updates main contrib non-free
deb-src http://deb.debian.org/debian-security $DEBIAN_VERSION/updates main contrib non-free
deb http://ftp.debian.org/debian $DEBIAN_VERSION-backports main contrib non-free
deb-src http://ftp.debian.org/debian $DEBIAN_VERSION-backports main contrib non-free
EOF

apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y --no-install-recommends install ca-certificates procps psmisc iotop iftop lsof mc joe nano vim less telnet rsync curl tcpdump strace zip unzip bzip2 tar dnsutils netcat net-tools ss-dev iputils-ping inetutils-traceroute
apt-get -y clean
apt-get -y autoremove
apt-get -y autoclean

rm --recursive --force /tmp/* /var/lib/{apt,cache,log}/ /var/log/* /usr/share/{doc,man,groff,info,lintian,linda} /var/cache/man/*
