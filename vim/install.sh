#!/bin/bash

VIMRC=~/.vimrc
PROJECTS_PATHS=("~/workspace/source/" "~/workspace/internal-source/")

if [ -L $VIMRC ];then
    echo "$VIMC already exists. Don't want to overwrite. Exiting!"
    exit
fi

sudo apt-get -q -y install vim vim-nox exuberant-ctags pylint yapf3 
mkdir -p ~/.vim/
cd vim
cp -r bundle ~/.vim/
cp -n vimrc ~/.vimrc
vim +BundleInstall +qall
echo "\" Colorscheme" >> $VIMRC
echo "colorscheme molokai" >> $VIMRC
echo "let g:rehash256 = 1" >> $VIMRC

for proj in ${PROJECTS_PATHS[@]}; do
    echo -n "Running ctags for $proj"
    ctags -f $proj/tags -R $proj
    echo " Done!"
done
echo "All Done!"
