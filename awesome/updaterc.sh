#!/bin/bash

SCRIPT=$(readlink -f "$0")
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
      cp -rf $dst/$filename /tmp/$filename$RANDOM
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

update_rc ${HOME} $BASEDIR .xinitrc .Xresources .irssi .inputrc .Xmodmap .tmux.conf
update_rc ${HOME} $CONFIGDIR .bashrc .gitconfig .pypirc .tmux .zshrc .apporcrc .common_tmux.conf .tern-config .irssi .pydistutils.cfg .npmrc
mkdir -p ${HOME}/.pip
update_rc ${HOME}/.pip $CONFIGDIR pip.conf

if [ ! -d ${HOME}/.config/awesome ]
then
  mkdir -p ${HOME}/.config/awesome
fi

# get awesome theme
if [ ! -d ${HOME}/Projects/awesome-copycats ]
then
  git clone https://github.com/copycat-killer/awesome-copycats.git ${HOME}/Projects/awesome-copycats
  cd ${HOME}/Projects/awesome-copycats
  git submodule init
  git submodule sync
  git submodule update
  cd -
fi
if [ ! -e ${HOME}/.config/awesome ]
then
  ln -s ${HOME}/Projects/awesome-copycats ${HOME}/.config/awesome
fi

update_rc ${HOME}/.config/awesome $BASEDIR rc.lua autorun.sh
