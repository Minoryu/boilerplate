#!/bin/sh

apt install ddclient -y
vi /etc/ddclient.conf

ddclient -daemon=0 -verbose
