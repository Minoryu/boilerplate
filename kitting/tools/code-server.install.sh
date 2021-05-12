#!/bin/bash
source ./utils/comments.sh
source ./node.install.sh
source ./npm.install.sh


if !(type "code-server" > /dev/null 2>&1); then
    comments "${BASH_SOURCE[0]##*/}" "let's go"
    npm install --global code-server
    code-server --version
fi
