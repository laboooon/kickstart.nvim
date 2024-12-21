set -e

sudo apt-get install -y ripgrep

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

cp tmux.conf ~/.tmux.conf
cp bashrc ~/.bashrc

rm -rf "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

echo "installed successfully"
