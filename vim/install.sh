#!/bin/bash
#Author: apporc

OS=$(uname)
if [ "$OS" == "Darwin" ];then
  SCRIPT=$(greadlink -f "$0")
else
  SCRIPT=$(readlink -f "$0")
fi
LOTUS_PWD=$(dirname $SCRIPT)
gnome=n
javascript=n
APT=apt-get
YUM=yum
EMERGE=emerge
PACMAN=pacman


usage () {
  echo "Usage: $0 [-hij] [-o OS]"
  echo "-h    Show this help."
  echo "-o    The operating system name, supported now including centos, ubuntu, fedora, redhat, debian, gentoo, arch."
}

parse_opt () {
  while getopts "hijo:" opt
  do
      case $opt in
          h) usage;exit 0;;
          o) os=$OPTARG;;
      esac
  done
  if [ -z $os ];then
    # must specify an os argument.
    usage
    exit 1
  fi
}


install_pack () {
  PACK=$@
  if [ $os == 'ubuntu' -o $os == 'debian' ];then
    sudo ${APT} -y install $PACK
  elif [ $os == 'fedora' -o $os == 'centos' -o $os == 'redhat' ];then
    sudo ${YUM} install -y $PACK
  elif [ $os == 'gentoo' ];then
    sudo ${EMERGE} $PACK
  elif [ $os == 'arch' ]; then
    sudo ${PACMAN} --noconfirm --needed -S $PACK
  elif [ $os == 'macos' ]; then
    brew install $PACK
  fi
}

npm_config () {
  # fuck gfw
  sudo npm config set registry https://registry.npm.taobao.org --global
  sudo npm config set disturl https://npm.taobao.org/dist --global
}

npm_install () {
  PACK=$@
  sudo npm install -d $PACK
}

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

setup_for_neovim () {
    mkdir -p ${HOME}/.config/nvim
    ln -sf ${LOTUS_PWD}/.vimrc ${HOME}/.config/nvim/init.vim
    pip2 install neovim
    pip3 install neovim
    # install dein package manager for neovim
    if [ ! -d "{HOME}/.cache/dein/repos/github.com/Shougo/dein.vim" ];then
      git clone https://github.com/Shougo/dein.vim ~/.cache/dein/repos/github.com/Shougo/dein.vim
    fi
}

setup_for_python () {
      pip2 install jedi pygments pylint flake8
      pip3 install jedi pygments pylint flake8
}

setup_for_javascript () {
    npm_config
    npm_install npm@latest jslint bower gulp
  }

main () {
    echo "Please input your password when you are asked to."
    echo "======================================================="

    if [ "$os" != "macos" ];then
      install_pack gcc make python2 python3 ctags npm neovim xsel go
    else
      brew tap neovim/neovim
      brew tap homebrew/dupes
      brew install grep --with-default-names
      install_pack ctags-exuberant npm neovim go
    fi

    # config files
    update_rc $HOME ${LOTUS_PWD} .vimrc .lotusvim
    update_rc $HOME ${LOTUS_PWD}/.lotusvim/configs .pylintrc .vimpressrc
    update_rc $HOME/.config/ ${LOTUS_PWD}/.lotusvim/configs flake8

    # neovim
    setup_for_neovim

    # python
    setup_for_python

    # javascript
    setup_for_javascript

    echo "======================================================="
    echo "Done."
    exit 0
}

parse_opt $@
main
