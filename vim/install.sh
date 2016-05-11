#!/bin/bash
#Author: apporc

SCRIPT=$(readlink -f "$0")
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
  echo "-i    Install vim-gnome automatically."
  echo "-j    Prepare for javascript(install npm, eg), default no."
}

parse_opt () {
  while getopts "hijo:" opt
  do
      case $opt in
          h) usage;exit 0;;
          o) os=$OPTARG;;
          i) gnome=y;;
          j) javascript=y;;
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
    fi
}

npm_config () {
  # fuck gfw
  sudo npm config -g set registry="http://r.cnpmjs.org"
}

npm_pack () {
  PACK=$@
  sudo npm install -g -d $PACK
}

install_vim_gnome () {
  if [ $os == 'ubuntu' -o $os == 'debian' ];then
    sudo ${APT} -y install vim-gnome
    #Use vim-tiny as vi
    sudo update-alternatives --set vi /usr/bin/vim.tiny
  elif [ $os == 'fedora' -o $os == 'centos' -o $os == 'redhat' ];then
    sudo ${YUM} install -y vim-X11
  elif [ $os == 'gentoo' ];then
    sudo ${EMERGE} vim
  elif [ $os == 'arch' ]; then
    sudo ${PACMAN} --noconfirm --needed -S vim
  fi
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

setting_neovim () {
    ln -sf ${LOTUS_PWD}/.vimrc ${HOME}/.config/nvim/init.vim
    install_pack python2-neovim xsel
}

main () {
    echo "Please input your password when you are asked to."
    echo "======================================================="

    if [ -z "$gnome" -o "$gnome" == 'y' -o "$gnome" == 'Y' ];then
        install_vim_gnome
    fi

    install_pack gcc make python-setuptools cscope ctags python-pygments npm

    if [ "$os" == 'arch' ];then
      install_pack python2-pylint
      install_pack python2-flake8
    else
      install_pack pylint
      install_pack python-flake8
    fi
    update_rc $HOME ${LOTUS_PWD} .vimrc .lotusvim
    update_rc $HOME ${LOTUS_PWD}/.lotusvim/configs .pylintrc .vimpressrc
    update_rc $HOME/.config/ ${LOTUS_PWD}/.lotusvim/configs flake8

    # javascript rules.
    if [ $javascript == 'y' ]
    then
      npm_config
      npm_pack jslint bower gulp
    fi

    # neovim
    setting_neovim
    echo "======================================================="
    echo "Done."
    exit 0
}

parse_opt $@
main
