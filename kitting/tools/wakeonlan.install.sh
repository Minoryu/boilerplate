#!/bin/bash
source ./utils/comments.sh


if !(type "wakeonlan" > /dev/null 2>&1); then
    comments "${BASH_SOURCE[0]##*/}" "let's go"
    apt install wakeonlan
fi
