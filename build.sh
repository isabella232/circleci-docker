#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

if [ "${IMT_AUTOMATED_BUILD:-}" == "1" ]; then

    echo ""
    exit 0

fi


docker build -t integromat/circleci-docker $@ .
