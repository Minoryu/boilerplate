#!/bin/bash
source ./util/comments.sh


if !(type "curl" > /dev/null 2>&1); then
  comments "${BASH_SOURCE[0]##*/}" "let's go"
  apt install curl -y
fi

