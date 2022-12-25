#! /bin/bash

sudo apt-get install vim fish pandoc ccls npm fzf curl fd-find -y

# install neovim
echo "Would you like to reinstall Neovim from source? (Y/n)"
read rebuildNvim
if ["$rebuildNvim" == "Y"] || ["$rebuildNvim" == "y"];then
	sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen -y
	git clone https://github.com/neovim/neovim
	cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
	git checkout stable
	sudo make install
	cd ..
	rm neovim -rf
fi

ln -s /run/media/$USER ~/Drives

sudo rm ~/.config/nvim -r
cp nvim ~/.config/ -r
cp vimrc ~/.vimrc
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp tmux.conf ~/.tmux.conf

cp fish ~/.config/ -r
cp bashrc ~/.bashrc
[[ ! $(grep "exec fish" $HOME/.zshrc) ]] && echo "exec fish" >> ~/.zshrc

curl -sS https://starship.rs/install.sh | sh
