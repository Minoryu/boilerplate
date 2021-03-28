#!/bin/sh
source ./comments.sh
source ./curl.install.sh

comments "${BASH_SOURCE[0]##*/}\n let's go"


if !(type "node" > /dev/null 2>&1); then
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    apt-get install -y nodejs
fi
node -v
