#!/bin/bash
source ./utils/comments.sh
source ./curl.install.sh


if !(type "docker" > /dev/null 2>&1); then
    comments "${BASH_SOURCE[0]##*/}" "let's go"
    curl -sSL https://get.docker.com | sh
fi


