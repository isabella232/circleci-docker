#!/bin/bash

set -euxo pipefail
IFS=$'\n\t'

apt-get -y --no-install-recommends install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb
