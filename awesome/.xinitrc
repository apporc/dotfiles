#!/bin/sh
#
# User's .xinitrc file

# Merge custom X resources
[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"

# Config Input Method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

# Turn beep off
xset -b
# Start window manager
exec awesome 2> ~/.awesome.log
