#!/bin/bash

set -euxo pipefail
IFS=$'\n\t'

apt-get -y install python python-pip
pip install --upgrade pip setuptools

apt-get install python3-pip
pip3 install --upgrade pyinstaller

rm -r /root/.cache
