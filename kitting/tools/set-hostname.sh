#!/bin/bash
source ../tools/utils/comments.sh

comments "${BASH_SOURCE[0]##*/}" "let's go"

sudo hostnamectl set-hostname $1

comments "do below this commands as root user."
cat <<EOD
sed -i -e '\$d' /etc/hosts
echo "127.0.1.1		$1" >> /etc/hosts

EOD
