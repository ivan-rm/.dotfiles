if status is-interactive
    # Commands to run in interactive sessions can go here

    # Automatically start Tmux and don't nest inside another tmux
    and not set -q TMUX
    # Create session 'main' or attach to 'main' if already exists.
    tmux new-session -A -s main
end

# Remove greeting message
set fish_greeting

# Enable lazydocker to work with podman
export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock

# Set up fzf key bindings
fzf --fish | source
set_fzf_colors

# Setup zoxide
zoxide init fish --cmd cd | source

## Aliases as abbreviations
# File system
abbr --add ls eza -lh --group-directories-first --icons
abbr --add la ls -A
abbr --add l ls -l
abbr --add ll ls -la
abbr --add lt eza --tree --level 2 --long --icons --git
abbr --add lta lt -a
abbr --add ff fzf --preview bat --style numbers --color always {}
abbr --add fd fdfind

# Directories
abbr --add .. cd ..
abbr --add ... cd ../..
abbr --add .... cd ../../..

# Tools
abbr --add n nvim
abbr --add vim nvim
abbr --add g git
abbr --add d podman
abbr --add docker podman
abbr --add lzg lazygit
abbr --add lzd lazydocker

# Git
abbr --add gcm git commit -m
abbr --add gcam git commit -a -m
abbr --add gcad git commit -a --amend

# Manage dotfiles with bare repo
#abbr --add dot /usr/bin/git --git-dir $HOME/.dotfiles --work-tree $HOME

# Utils
abbr --add myip curl ifconfig.me
