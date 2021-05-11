#!/bin/bash

source ./util/comments.sh
source ./node.install.sh
source ./rbenv.install.sh


if !(type "git" > /dev/null 2>&1); then

    comments "${BASH_SOURCE[0]##*/}" "let's go"

    mkdir ~/.config/nvim
    mkdir ~/.config/nvim/plugins
    cp -r ./settings/neovim/* ~/.config/nvim

    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein

    rm -rf ./installer.sh

    apt install neovim -y
    npm install -g neovim

    # deal with errors in advance
    apt install ruby-dev -y
    gem install neovim

    # python3 install
    pyenv install 3.9.4
    pyenv virtualenv 3.9.4 neovim3
    pyenv shell neovim3
    pip install pynvim

    # python2 install
    pyenv install 2.7.16
    pyenv virtualenv 2.7.16 neovim2
    pyenv shell neovim2
    pip install pynvim

fi
