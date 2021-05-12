#!/bin/bash
source ./utils/comments.sh


if !(type "pip3" > /dev/null 2>&1); then
    comments "${BASH_SOURCE[0]##*/}" "let's go"
    apt install python3-pip -y
    pip3 --version
fi

