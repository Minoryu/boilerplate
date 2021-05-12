#!/bin/bash
source ../tools/utils/comments.sh

comments "${BASH_SOURCE[0]##*/}" "let's go"

cd ../tools
read -p "input hostname > "hostname
if [ $hostname ]; then
    sudo ./set-hostname.sh $hostname
else
    comments "ERROR" "skip to change hostname."
fi
