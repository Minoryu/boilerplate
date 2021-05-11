#!/bin/bash

# install
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt-get install -y nodejs git-all

node entrypoint.js





#!/bin/sh
# reference: https://qiita.com/kentarok/items/6e818c2e6cf66c55f19a


HOSTNAME=hostname1

###############################


sudo apt -y install git git-core


cat <<-EOD >> /etc/dhcpcd.conf

#add $(date "+%Y%m%d")
interface wlan0
static ip_address=$STATIC_IP
static routers=$ROUTER_IP
static domain_name_servers=$ROUTER_IP 8.8.8.8

EOD

hostnamectl set-hostname $HOSTNAME
