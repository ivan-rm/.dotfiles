# Personal configuration files

## I use Fedora and this is my personal set up

To replicate the dotfiles in a new system run the following commands:

'''
git clone <git@github.com>:ivan-rm/.dotfiles.git
cd .dotfiles
stow -Sr .
git reset --hard
'''

To get rid of the symlinks run:
'''
stow -D .
'''
