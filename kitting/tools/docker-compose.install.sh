#!/bin/bash
source ./utils/comments.sh
source ./git.install.sh
source ./docker.install.sh

# references:
# https://qiita.com/zono_0/items/30f2460acf2e8873024d


if !(type "docker-compose" > /dev/null 2>&1); then

    comments "${BASH_SOURCE[0]##*/}" "let's go"

    cd ~
    git clone https://github.com/docker/compose.git
    cd compose

    git checkout bump-1.23.2

    comments "build docker-compose application"
    ./script/build/linux

    comments "change config"
    sed -i -e 's:^VENV=/code/.tox/py36:VENV=/code/.venv; python3 -m venv $VENV:' script/build/linux-entrypoint
    sed -i -e '/requirements-build.txt/ i $VENV/bin/pip install -q -r requirements.txt' script/build/linux-entrypoint

    comments "build image docker-compose. it takes about 30 minutes"
    docker build -t docker-compose:armhf -f Dockerfile.armhf .

    comments "make binary and locate"
    docker run --rm --entrypoint="script/build/linux-entrypoint" -v $(pwd)/dist:/code/dist -v $(pwd)/.git:/code/.git "docker-compose:armhf"
    cp dist/docker-compose-Linux-armv7l /usr/bin/docker-compose

    comments "owner permisstions"
    chown root:root /usr/bin/docker-compose
    chmod 0755 /usr/bin/docker-compose

    comments "check"
    docker-compose --version

    cd ~
    comments "pwd: ${pwd}"
    comments "remove working directory"
    rm -rf ~/compose

fi
