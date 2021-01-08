#!/bin/bash


# Get vim pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Get airline
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

# Get arline themes
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes

# Get fugutive
git clone https://github.com/tpope/vim-fugitive ~/.vim/bundle/vim-fugitive

# Get youcompleteme
git clone https://github.com/valloric/youcompleteme ~/.vim/bundle/youcompleteme
apt install build-essential cmake vim-nox python3-dev
apt install mono-complete golang nodejs default-jdk npm
pushd ~/.vim/bundle/youcompleteme
python3 install.py --all
popd

# Get nerdtree
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree

# Get miramare color
mkdir ~/.vim/colors
cp ./miramare.vim ~/.vim/colors

