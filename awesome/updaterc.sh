#!/bin/bash

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname $SCRIPT)

update_rc () {
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
      cp -rf $dst/$filename /tmp
      rm -rf $dst/$filename
    fi
    ln -sf $src/$filename $dst
  done
}

update_rc ~ $BASEDIR .xinitrc .Xresources
update_rc ~/.config/awesome $BASEDIR rc.lua
update_rc ~/.config/awesome $BASEDIR themes
