#!/bin/bash

set -euox pipefail
IFS=$'\n\t'

apt-get -y install python python-pip
pip install --upgrade pip setuptools pyinstaller
rm -r /root/.cache