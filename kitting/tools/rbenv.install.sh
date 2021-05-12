#!/bin/bash
source ./utils/comments.sh


if !(type "rbenv" > /dev/null 2>&1); then
  comments "${BASH_SOURCE[0]##*/}" "let's go"
  apt install rbenv -y

  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc

fi
