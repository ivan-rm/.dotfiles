#!/usr/bin/sh

set -e pipefail

sudo apt update
sudo apt upgrade
flatpak update

sudo apt install -y curl trurl eza fd-find bat zoxide ripgrep fzf tldr jq vlc htop
sudo apt install -y build-essential gdb valgrind make neovim fish stow
sudo aptinstall -y fonts-cascadia-code fonts-jetbrains-mono
sudo apt install -y wireshark nmap virt-manager bind9-dnsutils
#sudo apt install lazygit    # When it becomes available

sudo usermod -a -G wireshark $USER

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Update completions
tldr -u
fish -c fish_update_completions


flatpak install -y flathub org.nickvision.tubeconverter
flatpak install -y flathub org.gaphor.gaphor

# Enable the firewall
sudo ufw enable
sudo ufw status
