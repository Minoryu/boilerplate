#!/bin/bash

# install
cd ../tools
git.install.sh
node.install.sh

node entrypoint.js
