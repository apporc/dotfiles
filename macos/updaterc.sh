#!/bin/bash

# install coreutils to enable greadlink
brew install coreutils

SCRIPT=$(greadlink -f "$0")
BASEDIR=$(dirname $SCRIPT)
CONFIGDIR=$BASEDIR/../configs

update_rc () {
  #$1 destination directory
  #$2 source directory
  #$3 $4 ... filenames
  dst=$1
  src=$2
  shift
  shift
  filenames=$@
  for filename in $filenames
  do
    if [[ -e $dst/$filename ]];then
      echo "Old $filename detected"
      echo "Backing up old $filename to /tmp"
      echo "Check that yourself"
      cp -Rf $dst/$filename /tmp/$filename$RANDOM
      if [[ -d $dst/$filename ]];then
        rm -rf $dst/$filename
      else
        rm -f $dst/$filename
      fi
    fi
    ln -sf $src/$filename $dst
  done
}

# get oh-my-zsh
if [ ! -d ~/Projects/oh-my-zsh ];then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/Projects/oh-my-zsh
fi
update_rc ${HOME} $BASEDIR .tmux.conf
update_rc ${HOME} $CONFIGDIR .bashrc .gitconfig .pypirc .tmux .zshrc .apporcrc .common_tmux.conf .tern-config .irssi .pydistutils.cfg

mkdir -p ${HOME}/.pip
update_rc ${HOME}/.pip $CONFIGDIR pip.conf

echo 'source ~/.bashrc' > ~/.bash_profile
