#!/bin/sh
source ./comments.sh

comments "${BASH_SOURCE[0]##*/}\n let's go"

# if !(type "pip" > /dev/null 2>&1); then
#     apt-get -y install python-pip
#     pip install --upgrade pip
# fi

if !(type "pip3" > /dev/null 2>&1); then
    apt-get -y install python3-pip
fi

# pip --version
pip3 --version
