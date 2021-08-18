#!/bin/bash

basepath=$(cd `dirname $0`; pwd)

# vim file
# setup dictionary
echo "Setup dictionary? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    #sudo sh -c "apt-get install stardict"
    #sudo sh -c "apt-get install sdcv"
    mkdir /tmp/lir_dictionary
    cp $basepath/dictionary/* /tmp/lir_dictionary/
    cd /tmp/lir_dictionary
    tar -xjf stardict-langdao-ec-gb-2.4.2.tar.bz2
    rm stardict-langdao-ec-gb-2.4.2.tar.bz2
    tar -xjf stardict-langdao-ce-gb-2.4.2.tar.bz2
    rm stardict-langdao-ce-gb-2.4.2.tar.bz2
    mkdir -p ~/.stardict/dic
    sudo sh -c "mv ./stardict-langdao-* ~/.stardict/dic"
    cd -
    rm -rf /tmp/lir_dictionary
    echo "=== DONE! ==="
fi

echo "Backup your original vim files? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    rm -rf $HOME/.vim_backup; mv -f $HOME/.vim $HOME/.vim_backup
    rm -f $HOME/.vimrc_backup; mv -f $HOME/.vimrc $HOME/.vimrc_backup
fi

rm -rf $HOME/.vim
rm -f $HOME/.vimrc

# vim files
ln -s $basepath $HOME/.vim
ln -s $basepath/_vimrc $HOME/.vimrc

# bundle
echo "Download Vundle? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    git clone https://github.com/VundleVim/Vundle.vim $HOME/.vim/bundle/Vundle.vim
fi

echo "=== DONE! ==="

