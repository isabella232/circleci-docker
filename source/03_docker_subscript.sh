#!/bin/bash

set -euxo pipefail
IFS=$'\n\t'

apt-get -y install curl

DOCKER_FILE_NAME=$(curl --fail --silent --location https://download.docker.com/linux/static/stable/x86_64/ | grep -Po '<a.*>\Kdocker-[0-9]+\.[0-9]+\.[0-9].*\.tgz(?=</a>)' | tail -1)
curl --fail --silent --location --output "/tmp/$DOCKER_FILE_NAME" "https://download.docker.com/linux/static/stable/x86_64/$DOCKER_FILE_NAME"
tar --extract --file "/tmp/$DOCKER_FILE_NAME" --strip-components 1 --directory /usr/local/bin/

docker --version

COMPOSE_VERSION=$(curl --fail --silent --show-error --location --silent https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
curl --fail --silent --show-error --location --output /tmp/docker-compose "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-Linux-x86_64"
chmod +x /tmp/docker-compose
mv --force /tmp/docker-compose /usr/local/bin/docker-compose

docker-compose -v
