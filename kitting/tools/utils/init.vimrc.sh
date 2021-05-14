#!/bin/bash

set_initial_vim() {
    cat <<-EOD >> ~/.vimrc
set nocompatible
set backspace=indent,eol,start
EOD
}
