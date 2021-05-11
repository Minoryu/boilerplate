#!/bin/bash

cat <<-EOD >> /root/.vimrc
set nocompatible
set backspace=indent,eol,start
EOD

cp /root/.vimrc ~/.vimrc
