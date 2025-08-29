#!/usr/bin/env bash

set -e pipefail

sudo apt update
sudo apt upgrade
flatpak update

# Firmware update
sudo fwupdmgr refresh
sudo fwupdmgr update

sudo apt install -y curl fd-find bat ripgrep fzf tldr jq vlc htop tmux
sudo apt install -y build-essential gdb valgrind just
sudo apt install -y fonts-cascadia-code fonts-jetbrains-mono
sudo apt install -y wireshark nmap virt-manager bind9-dnsutils
#sudo apt install lazygit    # When it becomes available

sudo usermod -a -G wireshark $USER

#rm -rdf ~/.config/nvim
#git clone https://github.com/LazyVim/starter ~/.config/nvim
#rm -rf ~/.config/nvim/.git

# Update completions
tldr -u

flatpak install -y flathub org.nickvision.tubeconverter
flatpak install -y flathub org.gaphor.Gaphor

# Enable the firewall
sudo ufw enable
sudo ufw status

#Install fonts
mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
cp JetBrainsMono/*.ttf ~/.local/share/fonts
rm -rf JetBrainsMono.zip JetBrainsMono
cd -

fc-cache

# Clone the dotfiles repo and use stow to symlink the config in place
#git clone git@github.com:ivan-rm/.dotfiles.git

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

