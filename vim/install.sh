#Lotus vimrc installation script
#Author: apporc

LOTUS_PWD=$(pwd)
os='ubuntu'
APT=apt-get
YUM=yum
EMERGE=emerge

usage () {
    echo "Usage: $0 [-h] [[-oi] [OS]]"
    echo "-o    The operating system name, supported now including centos, ubuntu, fedora, redhat, debian, gentoo."
    echo "-i    Install vim-gnome automatically."
}

install_vim_gnome () {
	if [ $os == 'ubuntu' -o $os == 'debian' ];then
	    sudo ${APT} -y install vim-gnome
	elif [ $os == 'fedora' -o $os == 'centos' -o $os == 'redhat' ];then
	    sudo ${YUM} install -y vim
	elif [ $os == 'gentoo' ];then
	    sudo ${EMERGE} vim
	fi
}

parse_opt () {
    while getopts "hoi:" opt
    do
        case $opt in
            h) usage;exit 0;;
            o) os=$OPTARG;;
	    i) gnome=y;;
        esac
    done
}

        cp  ${LOTUS_PWD}/lotusvim/configs/flake8 ~/.config/flake8

install_cscope () {
    if [ $os == 'ubuntu' -o $os == 'debian' ];then
        sudo ${APT} -y install cscope
    elif [ $os == 'fedora' -o $os == 'centos' -o $os == 'redhat' ];then
        sudo ${YUM} install -y cscope
    elif [ $os == 'gentoo' ];then
        sudo ${EMERGE} cscope
    fi
}

install_setuptools () {
    if [ $os == 'ubuntu' -o $os == 'debian' ];then
        sudo ${APT} -y install python-setuptools
    elif [ $os == 'fedora' -o $os == 'centos' -o $os == 'redhat' ];then
        sudo ${YUM} install -y python-setuptools
    elif [ $os == 'gentoo' ];then
        sudo ${EMERGE} python-setuptools
    fi
}

install_pylint () {
    if [ $os == 'ubuntu' -o $os == 'debian' ];then
        sudo ${APT} -y install pylint
    elif [ $os == 'fedora' -o $os == 'centos' -o $os == 'redhat' ];then
        sudo ${YUM} install -y pylint
    elif [ $os == 'gentoo' ];then
        sudo ${EMERGE} pylint
    fi
    cp  ${LOTUS_PWD}/lotusvim/configs/pylintrc ~/.pylintrc
}

main () {
    echo "Please input your password when you are asked to."
    echo "======================================================="

    if [ -z "$gnome" -o "$gnome" == 'y' -o "$gnome" == 'Y' ];then
        install_vim_gnome
    fi

    ln -s ${LOTUS_PWD}/lotusvimrc ~/.vimrc
    ln -s ${LOTUS_PWD}/lotusvim ~/.lotusvim

    install_setuptools
    install_cscope
    install_pylint

    echo "======================================================="
    echo "Done."
    exit 0
}

parse_opt $@
main
