#!/bin/bash

if ! which ansible; then
  echo "You better get yourself some ansible love! Install it now using your favorite package manager!"
  exit 1
fi

rm -f config.tar.gz
dest=$PWD/config.tar.gz
(cd $HOME; \
tar --ignore-failed-read -cvzf $dest \
    .ssh \
    .vimrc \
    .vim/neobundle.vim \
    .gitconfig \
    .tmux.conf \
    .tmate.conf \
    .config/nvim \
    .zsh* \
    .bash* \
)

ansible-playbook devenv.yaml -i ./hosts -v
