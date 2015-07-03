#!/bin/bash

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname $SCRIPT)

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

update_rc ~ $BASEDIR .xinitrc .Xresources .irssi .bashrc .tmux.conf .inputrc .gitconfig .pypirc .bashrc
update_rc ~/.config/awesome $BASEDIR rc.lua themes
