#!/bin/bash

set -euox pipefail
IFS=$'\n\t'

apt-get -y install python python-pip
pip install awscli --upgrade --user
mv --force ~/.local/bin/aws* /usr/local/bin/
