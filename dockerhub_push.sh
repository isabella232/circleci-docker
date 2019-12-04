#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

echo "Enter DOCKERHUB_USER:"
read DOCKERHUB_USER

echo "Enter DOCKERHUB_PASSWORD:"
read DOCKERHUB_PASSWORD

if [ -z "$ DOCKERHUB_USER" ] || [ -z "$DOCKERHUB_PASSWORD" ]; then
    echo "Invalid value entered"
    exit 1
fi

echo "$DOCKERHUB_PASSWORD" | docker login --username "$DOCKERHUB_USER" --password-stdin
docker push "integromat/circleci-docker"
