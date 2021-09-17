#!/bin/bash

set -euxo pipefail
IFS=$'\n\t'

apt-get -y --no-install-recommends install python2

NODE_VERSION='14'

DOWNLOAD_URL="https://nodejs.org/dist/latest-v$NODE_VERSION.x/"
FILE_EXTENSION=".tar.gz"
URL_PREFIX="node-v"
URL_POSTFIX="-linux-x64$FILE_EXTENSION"
NODE="/usr/bin/node"
NPM="/usr/bin/npm"

FILE_NAME=$(/usr/bin/curl --silent --show-error "$DOWNLOAD_URL" | grep -o 'href=["'"'"'][^"'"'"']*["'"'"']'  | grep -o "$URL_PREFIX.*$URL_POSTFIX")
INSTALL_VERSION="$FILE_NAME"
INSTALL_VERSION="${INSTALL_VERSION#*$URL_PREFIX}"
INSTALL_VERSION="${INSTALL_VERSION%%$URL_POSTFIX*}"
echo "Install node version \"$INSTALL_VERSION\""
if ! [[ "$INSTALL_VERSION" =~ ^[0-9]+.[0-9]+.[0-9]+$ ]]; then
    echo "\"$INSTALL_VERSION\" is invalid"
    exit 1
fi

BASE_DIRECTORY='/tmp'
FILE_PATH="$BASE_DIRECTORY/$FILE_NAME"

/usr/bin/curl --silent --show-error --output "$FILE_PATH" "$DOWNLOAD_URL$FILE_NAME"
DIRECTORY_NAME="${FILE_PATH%$FILE_EXTENSION}"
tar xf "$FILE_PATH" -C "$BASE_DIRECTORY"

cp --remove-destination --recursive --no-dereference --preserve=links "$DIRECTORY_NAME/bin"/* /usr/bin
cp --remove-destination --recursive --no-dereference --preserve=links "$DIRECTORY_NAME/lib"/* /usr/lib
rm --force --recursive "$DIRECTORY_NAME" "$HOME/.npm"


apt-get -y --no-install-recommends install graphicsmagick imagemagick
