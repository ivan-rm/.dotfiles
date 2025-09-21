if status is-interactive
    set -g fish_greeting ""

    fish_add_path "$HOME/.local/bin"

    set -x EDITOR nvim
    set -x DOTFILES "$HOME/.dotfiles"
    set -x XDG_CONFIG_HOME "$HOME/.config"

    set -x FZF_DEFAULT_COMMAND 'fdfind --type file --follow'
    set -x FZF_CTRL_T_COMMAND 'fdfind --type file --follow'
    set -x FZF_DEFAULT_OPTS '--height 20%'

    abbr -a c cargo
    abbr -a ct 'cargo t'
    abbr -a n nvim
    #abbr -a m make
    abbr -a g git
    abbr -a gc 'git checkout'
    abbr -a ga 'git add -p'
    abbr -a vimdiff 'nvim -d'

    abbr -a fd fdfind
    abbr -a bat batcat
    #abbr -a lzg 'lazygit'
    #abbr -a lzd 'lazydocker'
    abbr -a python python3
    abbr -a pip pip3
    abbr -a activate 'source .venv/bin/activate'
    abbr -a nve 'python3 -m venv .venv/'
    abbr -a dotf "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    abbr -a ff "fzf --preview 'batcat --style=numbers --color=always {}'"

    abbr -a gst 'git status -sb'
    abbr -a gcm 'git commit -m'
    abbr -a gcam 'git commit -a -m'
    abbr -a gcad 'git commit -a --amend'
end
