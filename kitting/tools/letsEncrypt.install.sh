#!/bin/bash
source ./util/comments.sh

comments "${BASH_SOURCE[0]##*/}" "let's go"

echo << EOD
pi
reference: https://certbot.eff.org/lets-encrypt/othersnap-nginx

pi-zero armv6
reference: https://certbot.eff.org/lets-encrypt/otherpip-nginx

EOD
