#!/bin/bash
source ./util/comments.sh


if !(type "git" > /dev/null 2>&1); then
    comments "${BASH_SOURCE[0]##*/}" "let's go"
    apt install git-all -y
fi
