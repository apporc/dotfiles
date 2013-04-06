#Lotus vimrc installation script

echo "Installing lotus vimrc."
if [ -e ~/.vimrc ];then
    echo "Got original vimrc."
    if [ -d ~/.vimbackup ];then
        echo "You'v already had a vimbackup dir,"
        read -p "would you like to delete it(Y/n)?" answer
        if [ $answer == 'y' -o $answer == 'Y' ];then
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

echo "Copying new vimrc."
cp -r lotus-vim ~/.lotus_vim
cp ~/.lotus_vim/vimrc ~/.vimrc

echo "Done."
