### Install script for setting up a new PopOS machine

sudo apt -y update
sudo apt -y upgrade

sudo apt install -y git wget curl trurl unzip stow
sudo apt install -y zoxide bat eza fd-find fzf ripgrep jq
sudo apt install -y gcc gdb valgrind docker.io virt-manager default-jdk
sudo apt install -y ffmpeg
sudo apt install -y wl-clipboard htop wireshark nmap 

# Allow running without sudo
sudo usermod -aG docker $USER
sudo usermod -aG wireshark $USER

# Install lazyGit
cd /tmp
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -sLo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar -xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz lazygit
cd -

# Install lazyDocker
cd /tmp
LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -sLo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"
tar -xf lazydocker.tar.gz lazydocker
sudo install lazydocker /usr/local/bin
rm lazydocker.tar.gz lazydocker
cd -

# Install lazyVim
cd /tmp
wget -O nvim.tar.gz "https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz"
tar -xf nvim.tar.gz
sudo install nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
sudo cp -R nvim-linux-x86_64/lib /usr/local/
sudo cp -R nvim-linux-x86_64/share /usr/local/
rm -rf nvim-linux-x86_64 nvim.tar.gz
cd -

# Install luarocks and tree-sitter-cli to resolve lazyvim :checkheatlh warnings
sudo apt install -y luarocks tree-sitter-cli

# Only attempt to set configuration if Neovim has never been run
if [ ! -d "$HOME/.config/nvim" ]; then
  # Use LazyVim
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  # Remove the .git folder, so you can add it to your own repo later
  rm -rf ~/.config/nvim/.git 


# Install fonts
mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/microsoft/cascadia-code/releases/download/v2407.24/CascadiaCode-2407.24.zip
unzip CascadiaCode-2407.zip -d CascadiaCode
cp CascadiaCode ~/.local/share/fonts
rm -rf CascadiaCode-2407.zip CascadiaCode

mkdir -p ~/.local/share/fonts/JetBrainsMono/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono 
cp JetBrainsMono ~/.local/share/fonts
rm -rf JetBrainsMono.zip JetBrainsMono

fc-cache
cd -

# Install rust 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
 . "$HOME/.cargo/env"
 rustup update

# Install completions
mkdir -p ~/.local/share/bash-completion/completions
rustup completions bash > ~/.local/share/bash-completion/completions/rustup

# Install rust tools
cargo install --locked zellij
cargo install --locked yazi-fm yazi-cli

# Stow config
cd ~/.dotfiles 
stow -v --adopt .
git reset --hard 

cd 

# Reboot machine 
sudo reboot now

