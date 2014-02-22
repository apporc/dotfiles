#Lotus vimrc installation script
#Author: apporc
#NOTE: If you just want to update, run ./install.sh -q

LOTUS_PWD=$(pwd)
quiet_install=0
os='ubuntu'
APT=apt-get
YUM=yum
EMERGE=emerge

usage () {
    echo "Usage: $0 [-h] [[-o] [OS]]"
    echo "-o    The operating system name, supported now including centos, ubuntu, fedora, redhat, debian, gentoo."
}

install_vim_gnome () {
    read -p "Do you want this script to install vim-gnome?(Y/n)" gnome
    if [ -z "$gnome" -o "$gnome" == 'y' -o "$gnome" == 'Y' ];then
        if [ $os == 'ubuntu' -o $os == 'debian' ];then
            sudo ${APT} -y install vim-gnome
        elif [ $os == 'fedora' -o $os == 'centos' -o $os == 'redhat' ];then
            sudo ${YUM} install -y vim
        elif [ $os == 'gentoo' ];then
            sudo ${EMERGE} vim
        fi
    fi
}

backup_original_vimrc () {
if [ -e ~/.vimrc ];then
    echo "Got original vimrc."
    if [ -d ~/.vimbackup ];then
        echo "You'v already had a vimbackup dir,"
        read -p "would you like to delete it(Y/n)?" answer
        if [ "$answer" != 'n' -a "$answer" != 'N' ];then
            #For the pycscope, we need to be root here.
            sudo rm -rf ~/.vimbackup
        else
            echo "Then please backup it somewhere else yourself."
            exit
        fi
    fi
    mkdir ~/.vimbackup
    mv -f ~/.vimrc ~/.vimbackup
    if [ -d ~/.lotus_vim ];then
        mv -f ~/.lotus_vim ~/.vimbackup
    fi
fi
}

parse_opt () {
    while getopts "ho:" opt
    do
        case $opt in
            h) usage;exit 0;;
            o) os=$OPTARG;;
        esac
    done
}

install_pycscope () {
    if [ -d ~/.lotus_vim/plugins/pycscope ]
    then
        cd ~/.lotus_vim/plugins/pycscope
        sudo python setup.py install
        cd -
    fi
}

install_pyflakes () {
    if [ -d ~/.lotus_vim/plugins/pyflakes ]
    then
        cd  ~/.lotus_vim/plugins/pyflakes
        sudo python setup.py install
        cd -
    fi
}

install_flake8 () {
    if [ -d ~/.lotus_vim/plugins/flake8 ]
    then
        cd  ~/.lotus_vim/plugins/flake8
        sudo python setup.py install
        cp  ${LOTUS_PWD}/configs/flake8 ~/.config/flake8
        cd -
    fi
}

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
    cp  ${LOTUS_PWD}/configs/pylintrc ~/.pylintrc
}

first_install () {
    echo "BTW, please input your password when you are asked to."
    echo "======================================================="

    install_vim_gnome

    backup_original_vimrc

    cp -r ${LOTUS_PWD}/lotus-vim ~/.lotus_vim
    cp ~/.lotus_vim/vimrc ~/.vimrc

    install_setuptools
    install_pycscope 
    install_cscope
    install_pyflakes
    install_flake8
    install_pylint

    echo "======================================================="
    echo "Done."
    exit 0
}

#main begins here.
#TODO don't ask those stupid questions, add options for them here.
#TODO sed the cscope.vim to set nocscopeverbose
#TODO from stackoverflow, one suggest me to substitude nnoremap with nmap
parse_opt $@

first_install
