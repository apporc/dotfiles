#Lotus vimrc installation script
#Author: apporc
#NOTE: If you just want to update, run ./install.sh -quiet

LOTUS_PWD=$(pwd)
quiet_install=0

install_vim_gnome () {
    read -p "Do you want this script to install vim-gnome?(Y/n)" gnome
    if [ -z "$gnome" -o "$gnome" == 'y' -o "$gnome" == 'Y' ];then
        sudo aptitude install vim-gnome
    fi
}

install_fontforge () {
    read -p "Do you want this script to install python-fontforge?(Y/n)" fontforge
    if [ -z "$fontforge" -o "$fontforge" == 'y' -o "$fontforge" == 'Y' ];then
        sudo aptitude install python-fontforge
    fi
}

patch_font () {
    read -p "Give you the font path you want to use. (eg, /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-R.ttf)" font
    if [ ! -d ~/.fonts ];then
        mkdir ~/.fonts
    fi
    cd ~/.fonts
    python ~/.lotus_vim/plugins/vim-powerline/fontpatcher/fontpatcher $font
    fc-cache -vf ~/.fonts
}

activate_fancy_powerline () {
    # with options -patchfont or not
    read -p "Would you like to use fancy mode for powerline?(Y/n)" fancy
    if [ -z "$fancy" -o "$fancy" == 'y' -o "$fancy" == 'Y' ];then
        if [ $# -eq 1 ];then
            if [ $1 == '-patchfont' ];then
                patch_font
            fi
        fi
        sed -i 's/unicode/fancy/g' ~/.lotus_vim/vimrcs/plugins/powerline.vim
        echo "Don't forget to change your terminal font to [your fontname]"
        echo "And add 'set guifont=[your fontname]' to ~/.lotus_vim/my_configs.vim"
    fi
}

backup_original_vimrc () {
if [ -e ~/.vimrc ];then
    echo "Got original vimrc."
    if [ -d ~/.vimbackup ];then
        echo "You'v already had a vimbackup dir,"
        read -p "would you like to delete it(Y/n)?" answer
        if [ "$answer" != 'n' -a "$answer" != 'N' ];then
            rm -rf ~/.vimbackup
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
    if [ $# -ne 1 ];then
        return 0
    fi
    if [ $1 == '-quiet' ];then
        quiet_install=1
    fi
}

quiet_install () {
    backup_original_vimrc
    cp -r ${LOTUS_PWD}/lotus-vim ~/.lotus_vim
    cp ~/.lotus_vim/vimrc ~/.vimrc
    activate_fancy_powerline
    exit 0

}

first_install() {
    read -p "This script is tend to work only on ubuntu, want to continue?(Y/n)" ubuntu
    if [ "$ubuntu" == 'n' -o "$ubuntu" == 'N' ];then
        exit
    fi
    echo "Ok, let's begin."
    echo "BTW, please input your password when you are asked to."
    echo "======================================================="

    install_vim_gnome

    install_fontforge

    backup_original_vimrc 

    cp -r ${LOTUS_PWD}/lotus-vim ~/.lotus_vim
    cp ~/.lotus_vim/vimrc ~/.vimrc

    activate_fancy_powerline -patchfont

    echo "======================================================="
    echo "Done."
    exit 0
}


#main begins here.
parse_opt $@

if [ $quiet_install -eq 1 ];then
    quiet_install
else
    first_install
fi
