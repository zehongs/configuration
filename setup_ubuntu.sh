#!/bin/bash

####################
# zsh
####################
apt-get -y install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh
wget "https://raw.githubusercontent.com/zehongs/configuration/master/cfg/.zshrc"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

####################
# tmux
####################
sudo apt-get install tmux
touch ~/.tmux.conf
echo "set-option -g mouse on

# make scrolling with wheels work
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M
" > .tmux.conf

# website: tmuxcheatsheet.com
