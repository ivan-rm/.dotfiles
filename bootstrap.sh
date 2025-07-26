#!/usr/bin/sh

set -e pipefail

sudo apt update
sudo apt upgrade
flatpak update

sudo apt install -y curl trurl eza fd-find bat zoxide ripgrep fzf tldr jq vlc htop
sudo apt install -y build-essential gdb valgrind make neovim fish stow plocate
#sudo aptinstall -y fonts-cascadia-code fonts-jetbrains-mono
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

#Install fonts
mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
cp JetBrainsMono/*.ttf ~/.local/share/fonts
rm -rf JetBrainsMono.zip JetBrainsMono


# Clone the dotfiles repo and use stow to symlink the config in place
git clone git@github.com:ivan-rm/.dotfiles.git

cd .dotfiles
for d in */ ; do
    stow $d
done

