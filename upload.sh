#!/bin/bash

function CheckVariables()
{
    local VARIABLE_NAME
    for VARIABLE_NAME in "$@"; do

        if [ ! -v "$VARIABLE_NAME" ]; then
            echo "Variable $VARIABLE_NAME not declared"
            exit 1
        fi
    done
}


CheckVariables DOCKER_USER DOCKER_PASSWORD

docker login -u "$DOCKER_USER" -p "$DOCKER_PASSWORD"
docker push "integromat/circleci-docker:latest"
