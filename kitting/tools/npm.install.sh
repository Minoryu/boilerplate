#!/bin/sh

source ./comments.sh
comments "${BASH_SOURCE[0]##*/}\n let's go"

if !(type "npm" > /dev/null 2>&1); then
    curl -L https://www.npmjs.com/install.sh | sh
fi
npm -v
