#!/bin/bash

# install
if !(type "node" > /dev/null 2>&1); then
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    apt install -y nodejs git-all
    node -v
    git --version
fi

mkdir boilerplate
git clone -b develop https://github.com/Minoryu/boilerplate.git ./boilerplate
rm -rf entrypoint.sh

cd ./boilerplate/kitting/$1
./entrypoint.sh
