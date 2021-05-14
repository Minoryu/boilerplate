#!/bin/bash
source ../tools/utils/comments.sh
source ../tools/utils/init.vimrc.sh

comments "${BASH_SOURCE[0]##*/}" "let's go"


cd ../tools

# change hostname
read -p "input hostname > " hostname
if [ $hostname ]; then
    sudo ./set-hostname.sh $hostname
    comments "hostname is changed" "$hostname"
fi

# enable locale en_US.UTF-8
LANGUAGE=en_US.UTF-8
sudo ./utils/toggle.comment-out.sh $LANGUAGE /etc/locale.gen
sudo locale-gen $LANGUAGE
sudo update-locale LANG=en_US.UTF-8

comments "check locale" "$(locale -a)"

sudo set_locale
set_locale

sudo set_initial_vim
set_initial_vim
