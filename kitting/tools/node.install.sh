#!/bin/bash
source ./util/comments.sh


if !(type "node" > /dev/null 2>&1); then
  ./curl.install.sh
  comments "${BASH_SOURCE[0]##*/}" "let's go"
  
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  apt install nodejs -y
  node -v
fi

