#!/bin/bash

set -euxo pipefail
IFS=$'\n\t'

apt-get -y --no-install-recommends install gpg ca-certificates

/usr/bin/curl --location --silent --show-error 'https://dl.google.com/linux/linux_signing_key.pub' | gpg --dearmor > /etc/apt/trusted.gpg.d/google.gpg

cat << EOF > /etc/apt/sources.list.d/google-chrome.list
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
EOF

apt-get -y update
apt-get -y --no-install-recommends install google-chrome-stable
