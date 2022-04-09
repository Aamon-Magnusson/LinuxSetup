#! /bin/bash

sudo apt-get install neovim vim fish

ln -s /run/media/$USER ~/Drives

git clone https://github.com/Aamon-Magnusson/Dotfiles
cp Dotfiles/nvim ~/.conifg/ -r
git clone https://github.com/dracula/vim.git ~/.config/nvim/pack/themes/start/dracula
cp Dotfiles/vim ~/.vim
cp Dotfiles/vimrc ~/.vimrc
git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula

sudo rm -rf Dotfiles

cp fish ~/.config/ -r
cp bashrc ~/.bashrc
[[ ! $(grep "exec fish" $HOME/.zshrc) ]] && echo "exec fish" >> ~/.zshrc
