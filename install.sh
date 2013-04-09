#Lotus vimrc installation script
#aptitude install python-fontforge vim-gnome

LOTUS_PWD=$(pwd)

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

activate_fancy_powerline () {
read -p "Would you like to use fancy mode for powerline?(Y/n)" fancy
if [ -z "$fancy" -o "$fancy" == 'y' -o "$fancy" == 'Y' ];then
    read -p "Give you the font path you want to use. (eg, /usr/share/fonts/truetype/ubuntu-font-family/Ubuntu-R.ttf)" font
    if [ ! -d ~/.fonts ];then
        mkdir ~/.fonts
    fi
    cd ~/.fonts
    python ~/.lotus_vim/plugins/vim-powerline/fontpatcher/fontpatcher $font
    fc-cache -vf ~/.fonts
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

activate_fancy_powerline

echo "======================================================="
echo "Done."
