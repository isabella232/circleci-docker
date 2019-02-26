#!/bin/bash

set -euox pipefail
IFS=$'\n\t'

cd /tmp
git clone --single-branch https://github.com/sstephenson/bats.git
cd ./bats
./install.sh /usr/local
