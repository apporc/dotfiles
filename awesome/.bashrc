#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W] > '
# delete duplicate history lines
export HISTCONTROL=ignoreboth:erasedups
export EDITOR='nvim'
export BROWSER='chromium'

alias rm='rm -i'
alias xmind='XMind'
alias ls='ls --color=auto'
alias less='less -R'
alias grep='grep --color=always'
alias vim='nvim'

# tmux workspace alias
alias oslo="tmux_apporc oslo"
alias algo="tmux_apporc algorithm"
alias golang="tmux_apporc golang"

# scripts of myself
export PATH=${PATH}:${HOME}/Projects/dotfiles/scripts

# cabal
export PATH=${HOME}/.cabal/bin/:${PATH}

# dart lang
export PATH=${PATH}:${HOME}/Projects/dart

# go lang, arch linux go package need GOROOT to be /usr/lib/go
# export GOROOT=/usr/lib/go
export GOPATH=${HOME}/Projects/go
export PATH=${PATH}:${GOPATH}/bin

# adt
export PATH=${PATH}:/home/apporc/Software/devtool/adt-bundle-linux-x86_64-20140702/sdk/platform-tools
export PATH=${PATH}:/usr/local/bin/apporc

# ruby
export PATH=${PATH}:${HOME}/.gem/ruby/2.1.0/bin

# chromiumos dev, repo cmd
export PATH=${HOME}/Projects/depot_tools:${PATH}

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
