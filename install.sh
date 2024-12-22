set -e

sudo apt-get install -y ripgrep

# NVIM

#curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
#sudo rm -rf /opt/nvim
#sudo tar -C /opt -xzf nvim-linux64.tar.gz
#rm nvim-linux64.tar.gz

rm -rf ~/.config/nvim
cp -r nvim ~/.config/nvim

# TMUX

#cp tmux.conf ~/.tmux.conf
#rm -rf ~/.config/tmux/plugins/catppuccin
#mkdir -p ~/.config/tmux/plugins/catppuccin
#git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

# BASHRC

cp bashrc ~/.bashrc

# fuzzy history search
#rm -rf ~/.fzf
#git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

echo "installed successfully"
