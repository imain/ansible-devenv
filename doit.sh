#!/bin/bash

if ! rpm -q ansible; then
    sudo yum -y install ansible
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
