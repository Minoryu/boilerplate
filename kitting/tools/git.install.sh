#!/bin/sh
source ./comments.sh

comments "${BASH_SOURCE[0]##*/}\n let's go"

if !(type "git" > /dev/null 2>&1); then
    apt-get install -y git-all
fi
