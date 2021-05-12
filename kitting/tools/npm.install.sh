#!/bin/bash
source ./utils/comments.sh


if !(type "npm" > /dev/null 2>&1); then
    comments "${BASH_SOURCE[0]##*/}" "let's go"
    curl -L https://www.npmjs.com/install.sh | sh
    npm -v
fi
