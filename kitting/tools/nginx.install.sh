#!/bin/bash
source ./utils/comments.sh


if !(type "git" > /dev/null 2>&1); then
    comments "${BASH_SOURCE[0]##*/}" "let's go"
    apt install nginx -y

    echo "start nginx"
    echo "/etc/init.d/nginx start"

fi
