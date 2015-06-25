#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias xmind='XMind'
PS1='[\u@\h \W] > '
export EDITOR='vim'
export BROWSER='chromium'
export PATH=${HOME}/Projects/dart:${HOME}/.gem/ruby/2.1.0/bin:$PATH
export PATH=${HOME}/.cabal/bin/:${PATH}
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
