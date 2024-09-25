#!/bin/bash

apt update
apt install neovim gcc g++ llvm

bash gosetup.sh

cp ~/.bashrc ~/.bashrc_old
cp bashrc ~/.bashrc

echo "Setting up Neovim"

git clone https://github.com/lemonbrass/Neovim-Config.git ~/.config/nvim

echo "Installing c3"

tar -xf tools/c3c.tar.xz
tar -xf tools/lldlibs.tar.xz

cp ./usr / -r

echo "Done!"
echo "Now:"
echo "    source .bashrc"
echo "    and possibly remove the usr folder (not removed for safety reasons)"
