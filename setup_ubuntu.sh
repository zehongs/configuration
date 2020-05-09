#!/bin/bash

sudo apt-get update

####################
# zsh, locales(fix)
####################
apt-get -y install zsh locales
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(zsh-autosuggestions git zsh-syntax-highlighting)/g' ~/.zshrc

locale-gen "en_US.UTF-8" && update-locale LC_ALL="en_US.UTF-8"


####################
# tmux > 2.6
####################
apt-get install -y tmux
touch ~/.tmux.conf
echo "set -g mouse on" >> ~/.tmux.conf

# website: tmuxcheatsheet.com
