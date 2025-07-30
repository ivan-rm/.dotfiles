# Set up a Fedora fresh install

set -e

sudo dnf -y upgrade
flatpak -y update

# Update firmware
sudo fwupdmgr refresh --force
sudo fwupdmgr get-devices # Lists devices with available updates.
sudo fwupdmgr get-updates # Fetches list of available updates.
sudo fwupdmgr update

# Install software
sudo dnf install -y git curl
sudo dnf install -y fzf ripgrep bat zoxide fd-find jq tldr
sudo dnf install -y gcc gdb make valgrind
sudo dnf install -y wireshark nmap neovim htop
sudo dnf install -y vlc gimp
sudo dnf install -y cascadia-code-nf-fonts jetbrains-mono-fonts

# Install Flatpaks
flatpak install -y flathub org.gnome.World.PikaBackup
flatpak install -y flathub org.gaphor.Gaphor

# LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Update indexes
tldr -u

# Set hostname
sudo hostnamectl set-hostname nuc

# Configure gnome
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6
for i in {1..6}; do gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Super>$i']"; done
for i in {1..6}; do gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-$i" "['<Super><Shift>$i']"; done

#gsettings set org.gnome.mutter center-new-windows true

gsettings set org.gnome.desktop.calendar show-weekdate true

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'New Terminal Window'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'ptyxis --new-window'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Control>F1'
