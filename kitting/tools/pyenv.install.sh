#!/bin/bash
source ./util/comments.sh
source ./git.install.sh


CURRENT_DIRECTORY=$(pwd)

if !(type "pyenv" > /dev/null 2>&1); then
  comments "${BASH_SOURCE[0]##*/}" "let's go"

  git clone https://github.com/yyuu/pyenv.git ~/.pyenv

  cd ~/.pyenv
  git pull

  echo 'export PYENV_ROOT="${HOME}/.pyenv"' >> ~/.bashrc
  echo 'if [ -d "${PYENV_ROOT}" ]; then' >> ~/.bashrc
  echo '    export PATH=${PYENV_ROOT}/bin:$PATH' >> ~/.bashrc
  echo '    eval "$(pyenv init -)"' >> ~/.bashrc
  echo 'fi' >> ~/.bashrc
  exec $SHELL -l

  pyenv rehash
  pyenv install -l 

  cd $CURRENT_DIRECTORY
fi

git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

comments version
pyenv --version

echo "how to check installable versions."
echo "pyenv install -l"

