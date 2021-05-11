#!/bin/bash

# install
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
apt install -y nodejs git-all

mkdir boilerplate
git clone -b develop https://github.com/Minoryu/boilerplate.git ./boilerplate

cd ./boilerplate/kitting/$1
node entrypoint.js
