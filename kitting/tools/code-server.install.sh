#!/bin/sh

source ./comments.sh
comments "${BASH_SOURCE[0]##*/}\n let's go"

if !(type "node" > /dev/null 2>&1); then
    source ./node.install.sh
fi

npm install --global code-server
code-server --version

