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
    echo "Usage: $0 [-q] [-o [OS]]"
    echo "-q    Be quietly, if it is not the first time you install this vimrc."
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


install_fontforge () {
    read -p "Do you want this script to install python-fontforge?(Y/n)" fontforge
    if [ -z "$fontforge" -o "$fontforge" == 'y' -o "$fontforge" == 'Y' ];then
        if [ $os == 'ubuntu' -o $os == 'debian' ];then
            sudo ${APT} -y install python-fontforge
        elif [ $os == 'fedora' -o $os == 'centos' -o $os == 'redhat' ];then
            sudo ${YUM} install -y fontforge
        elif [ $os == 'gentoo' ];then
            ${EMERGE} python-fontforge
        fi
    fi
}

patch_font () {
    read -p "Give me the font path you want to use. (eg, /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-R.ttf)" font
    if [ "l$font" != "l" ]
    then
        if [ ! -d ~/.fonts ];then
            mkdir ~/.fonts
        fi
        cd ~/.fonts
        python ~/.lotus_vim/plugins/powerline/font/fontpatcher.py $font
        fc-cache -vf ~/.fonts
    fi
}

activate_fancy_powerline () {
    # with options -patchfont or not
    if [ $# -eq 1 ];then
        if [ $1 == '-patchfont' ];then
            patch_font
        fi
    fi
    echo "Don't forget to change your terminal font to [your fontname]"
    echo "And add 'set guifont=[your fontname]' to ~/.lotus_vim/my_configs.vim"
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
    while getopts "hqo:" opt
    do
        case $opt in
            h) usage;exit 0;;
            o) os=$OPTARG;;
            q) quiet_install=1;;
        esac
    done
}



update_submodule () {
    cd $LOTUS_PWD
    git submodule init
    git submodule update
    cd -
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

install_powerline () {
    if [ -d ~/.lotus_vim/plugins/powerline ]
    then
        cd ~/.lotus_vim/plugins/powerline
        sudo python setup.py install
        cd -
        if [ ! -d ~/.config/powerline ]
        then
            mkdir -p  ~/.config/powerline
        fi
        cp -r ~/.lotus_vim/plugins/powerline/powerline/config_files/* ~/.config/powerline
        cp -r ~/.lotus_vim/plugins/powerline/powerline/bindings/vim/plugin ~/.lotus_vim/plugins/powerline
# It's bad to have this bash prompt changed.
#        if [ -e ~/.bashrc ]
#        then
#            echo '. ~/.lotus_vim/plugins/powerline/powerline/bindings/bash/powerline.sh' >> ~/.bashrc
#        fi
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
    update_submodule

    echo "BTW, please input your password when you are asked to."
    echo "======================================================="

    install_vim_gnome

    install_fontforge

    backup_original_vimrc

    cp -r ${LOTUS_PWD}/lotus-vim ~/.lotus_vim
    cp ~/.lotus_vim/vimrc ~/.vimrc

    install_setuptools
    install_pycscope 
    install_cscope
    install_pyflakes
    install_flake8
    install_powerline
    install_pylint

    activate_fancy_powerline -patchfont

    echo "======================================================="
    echo "Done."
    exit 0
}

quiet_install () {
    update_submodule
    backup_original_vimrc
    cp -r ${LOTUS_PWD}/lotus-vim ~/.lotus_vim
    cp ~/.lotus_vim/vimrc ~/.vimrc
    activate_fancy_powerline
    exit 0

}

#main begins here.
#TODO don't ask those stupid questions, add options for them here.
#TODO sed the cscope.vim to set nocscopeverbose
#TODO from stackoverflow, one suggest me to substitude nnoremap with nmap
parse_opt $@

if [ $quiet_install -eq 1 ];then
    quiet_install
else
    first_install
fi
