#!/bin/bash
#Author: apporc

LOTUS_PWD=$(pwd)
os='ubuntu'
gnome=n
APT=apt-get
YUM=yum
EMERGE=emerge
PACMAN=pacman

usage () {
  echo "Usage: $0 [-h] [[-oi] [OS]]"
  echo "-o    The operating system name, supported now including centos, ubuntu, fedora, redhat, debian, gentoo, arch."
  echo "-i    Install vim-gnome automatically."
}

parse_opt () {
  while getopts "hio:" opt
  do
      case $opt in
          h) usage;exit 0;;
          o) os=$OPTARG;;
          i) gnome=y;;
      esac
  done
}

        cp  ${LOTUS_PWD}/lotusvim/configs/flake8 ~/.config/flake8

install_pack () {
    PACK=$1
    if [ $os == 'ubuntu' -o $os == 'debian' ];then
        sudo ${APT} -y install $PACK
    elif [ $os == 'fedora' -o $os == 'centos' -o $os == 'redhat' ];then
        sudo ${YUM} install -y $PACK
    elif [ $os == 'gentoo' ];then
        sudo ${EMERGE} $PACK
    elif [ $os == 'arch' ]; then
        sudo ${PACMAN} --noconfirm -S $PACK
    fi

}

install_vim_gnome () {
  if [ $os == 'ubuntu' -o $os == 'debian' ];then
    sudo ${APT} -y install vim-gnome
    #Use vim-tiny as vi
    sudo update-alternatives --set vi /usr/bin/vim.tiny
  elif [ $os == 'fedora' -o $os == 'centos' -o $os == 'redhat' ];then
    sudo ${YUM} install -y vim
  elif [ $os == 'gentoo' ];then
    sudo ${EMERGE} vim
  elif [ $os == 'arch' ]; then
    sudo ${PACMAN} --noconfirm -S vim
  fi
}

main () {
    echo "Please input your password when you are asked to."
    echo "======================================================="

    if [ -z "$gnome" -o "$gnome" == 'y' -o "$gnome" == 'Y' ];then
        install_vim_gnome
    fi

    ln -s ${LOTUS_PWD}/lotusvimrc ~/.vimrc
    ln -s ${LOTUS_PWD}/lotusvim ~/.lotusvim

    install_pack gcc
    install_pack make
    install_pack python-setuptools
    install_pack cscope
    install_pack pylint
    cp  ${LOTUS_PWD}/lotusvim/configs/pylintrc ~/.pylintrc
    install_pack ctags

    echo "======================================================="
    echo "Done."
    exit 0
}

parse_opt $@
main
