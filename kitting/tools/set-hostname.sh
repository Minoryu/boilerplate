#!/bin/bash
source ../tools/utils/comments.sh

comments "${BASH_SOURCE[0]##*/}" "let's go"

sed '$d' /etc/hostname
sed '$d' /etc/hosts

echo $1 >> /etc/hostname
echo "127.0.1.1		$1" >> /etc/hosts
