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

# get awesome-copycats
update_rc ${HOME} $BASEDIR .xinitrc .Xresources .irssi .inputrc .Xmodmap .tmux.conf
update_rc ${HOME} $CONFIGDIR .bashrc .gitconfig .pypirc .tmux .zshrc .apporcrc .common_tmux.conf .tern-config
if [ ! -d ${HOME}/.config/awesome ]
then
  mkdir -p ${HOME}/.config/awesome
fi
git clone https://github.com/copycat-killer/awesome-copycats.git ~/Projects/awesome-copycats
ln -s ~/Projects/awesome-copycats ~/.config/awesome
cd ~/Projects/awesome-copycats
git submodule init
git submodule sync
git submodule update
cd -
update_rc ${HOME}/.config/awesome $BASEDIR rc.lua
