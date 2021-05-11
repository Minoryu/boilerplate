#!/bin/bash

# install
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt-get install -y nodejs git-all

node entrypoint.js
