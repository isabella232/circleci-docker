#!/bin/bash

set -euox pipefail
IFS=$'\n\t'

apt-get -y install curl

VERSION=$(curl --fail --silent --location https://storage.googleapis.com/kubernetes-release/release/stable.txt)
curl --fail --silent --location --output /tmp/kubectl https://storage.googleapis.com/kubernetes-release/release/$VERSION/bin/linux/amd64/kubectl

chmod +x /tmp/kubectl
mv --force /tmp/kubectl /usr/local/bin/kubectl
