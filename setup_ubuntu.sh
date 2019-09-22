#!/bin/bash

######## zsh
# step 1: install zsh, make it default shell
sudo apt-get install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

# step 2: change theme from agnoster to af-magic 
sed -i'' -e "s/agnoster/af-magic/g" ~/.zshrc 

# step 3: plugin: autosuggestions and syntax-highlighting
cd ~
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# plugins，新增2行选项，注意必须得将syntax-highlighting放在最后。
sed -i'' -e "s/\s*git$/git zsh-autosuggestions zsh-syntax-highlighting/g" ~/.zshrc


######## tmux
# Step4: tmux
sudo apt-get install tmux
touch ~/.tmux.conf

echo "set-option -g mouse on

# make scrolling with wheels work
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M
" > .tmux.conf