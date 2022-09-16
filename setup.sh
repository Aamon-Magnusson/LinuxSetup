#! /bin/bash

sudo apt-get install neovim vim fish pandoc ccls npm fzf curl fd-find

ln -s /run/media/$USER ~/Drives

sudo rm ~/.config/nvim -r
cp nvim ~/.config/ -r
git clone https://github.com/dracula/vim.git ~/.config/nvim/pack/themes/start/dracula
sudo npm i -g vim-language-server pyright bash-language-server live-server
cp vim ~/.vim
cp vimrc ~/.vimrc
git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula

cp fish ~/.config/ -r
cp bashrc ~/.bashrc
[[ ! $(grep "exec fish" $HOME/.zshrc) ]] && echo "exec fish" >> ~/.zshrc

curl -sS https://starship.rs/install.sh | sh
