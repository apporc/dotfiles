#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Run tmux
# [[ -z "$TMUX" ]] && exec tmux attach-session -t apporc

alias ls='ls --color=auto'
alias startx='startx &> ~/.xlog'
PS1='[\u@\h \W] > '
export EDITOR='vim'
