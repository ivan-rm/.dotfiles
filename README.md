# Personal configuration files

### I use PopOS and this is my personal set up

To replicate the dotfiles in a new system run the following commands:

```
git clone <git@github.com>:ivan-rm/.dotfiles.git \
cd .dotfiles \
stow -v --adopt . \
git reset --hard \
```


To get rid of the symlinks run:

```
stow -D .
```
#### If setting up a new machine, run the installer as root:

```
cd ~/.dotfiles
sudo ./install.sh
```
The .dotfiles will automatically be stowed.