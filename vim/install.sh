#!/bin/bash

VIMRC=~/.vim/.vimrc
VIMRC_LINK=~/.vimrc
PROJECTS_PATHS=("~/workspace/source/" "~/workspace/internal-source/")

if [ -L $VIMRC_LINK ];then
    echo "$VIMC_LINK already exists. Don't want to overwrite. Exiting!"
    exit
fi

sudo apt-get install vim vim-nox exuberant-ctags pylint yapf yapf3 
mkdir ~/.vim/
cp -r bundle ~/.vim/
cp vimrc ~/.vimrc
vim +BundleInstall +qall
echo "\" Colorscheme" >> $VIMRC_LINK
echo "colorscheme molokai" >> $VIMRC_LINK
echo "let g:rehash256 = 1" >> $VIMRC_LINK

for proj in ${PROJECTS_PATHS[@]}; do
    echo -n "Running ctags for $proj"
    ctags -f $proj/tags -R $proj
    echo " Done!"
done
echo "All Done!"
