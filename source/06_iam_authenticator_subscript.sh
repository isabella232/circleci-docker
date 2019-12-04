#!/bin/bash

set -euxo pipefail
IFS=$'\n\t'

apt-get -y install curl

curl --location --silent --output /tmp/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator
chmod +x /tmp/aws-iam-authenticator
mv /tmp/aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
