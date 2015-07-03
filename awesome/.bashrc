#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W] > '
export EDITOR='vim'
export BROWSER='chromium'

alias rm='rm -i'
alias xmind='XMind'
alias ls='ls --color=auto'

# cabal
export PATH=${HOME}/.cabal/bin/:${PATH}

# dart lang
export PATH=${PATH}:${HOME}/Projects/dart

# go lang
export GOROOT=${HOME}/Projects/go/root
export PATH=${PATH}:${GOROOT}/bin
export GOPATH=${HOME}/Projects/go/tools

# adt
export PATH=${PATH}:/home/apporc/Software/devtool/adt-bundle-linux-x86_64-20140702/sdk/platform-tools
export PATH=${PATH}:/usr/local/bin/apporc

# ruby
export PATH=${PATH}:${HOME}/.gem/ruby/2.1.0/bin


[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
