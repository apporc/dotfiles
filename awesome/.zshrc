# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/apporc/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
prompt adam1

# Load common settings
source ~/.apporcrc
