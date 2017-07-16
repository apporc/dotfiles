#!/usr/bin/env bash

if [ $(tmux ls 2>&1 | grep apporc | grep -v attached |wc -l) -eq 1 ]
  then
    urxvt -e tmux source-file /home/apporc/.tmux/apporc.conf
  fi

fcitx -d -r
