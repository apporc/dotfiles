#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias tmux='tmux attach-session'

alias ls='ls --color=auto'
alias xmind='XMind'
alias startx='startx &> ~/.xlog'
PS1='[\u@\h \W] > '
export EDITOR='vim'
export BROWSER='chromium'
export PATH=/home/apporc/Projects/dart:/home/apporc/.gem/ruby/2.1.0/bin:$PATH
