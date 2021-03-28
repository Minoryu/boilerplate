#!/bin/sh
source ./comments.sh
source ./curl.install.sh

comments "${BASH_SOURCE[0]##*/}\n let's go"

if !(type "docker" > /dev/null 2>&1); then
    curl -sSL https://get.docker.com | sh
fi


