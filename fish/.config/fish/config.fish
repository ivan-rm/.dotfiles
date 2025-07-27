if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # Set the theme
    source ~/.config/fish/themes/modus_operandi.fish

    # Welcome message
    set -g fish_greeting

    # Automatically start a tmux session
    if type -q tmux
        if not test -n "$TMUX"
            tmux attach-session -t default; or tmux new-session -s default
        end
    end

  # Enable shell integration
    if command -sq zoxide
        zoxide init fish | source
    end

    if command -sq fzf
        #fzf --fish | source    # When it becomes available
        source /usr/share/fish/completions/fzf.fish
        source /usr/share/doc/fzf/examples/key-bindings.fish
    end

    # Editor used by CLI
    set -gx EDITOR nvim
    set -gx SUDO_EDITOR $EDITOR

    # Color man pages with bat
    set -gx MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | batcat -p -lman'"

    # File system
    alias ls 'eza -lh --group-directories-first --icons=auto'
    alias la 'eza -lha --group-directories-first --icons=auto'
    alias lt 'eza --tree --level=2 --long --icons --git'
    alias l 'eza -bGF --header --git --color=always --group-directories-first --icons'
    alias ll 'eza -la --icons --octal-permissions --group-directories-first'
    alias lta 'eza -a --tree --level=2 --long --icons --git'
    abbr --add ff "fzf --preview 'batcat --style=numbers --color=always {}'"
    abbr --add fd fdfind
    alias cd z

    # Directories
    abbr --add .. 'cd ..'
    abbr --add ... 'cd ../..'
    abbr --add .... 'cd ../../..'

    # Tools
    alias code='code --enable-features=UseOzonePlatform --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto'
    abbr --add n nvim
    abbr --add g git
    abbr --add d docker
    alias bat 'batcat'
    abbr --add lzg lazygit
    abbr --add lzd lazydocker
    abbr --add python python3
    abbr --add pip pip3
    #abbr --add zj zellij

    # Git 
    abbr --add gst 'git status -sb'
    abbr --add gcm 'git commit -m'
    abbr --add gcam 'git commit -a -m'
    abbr --add gcad 'git commit -a --amend'

    # Managing dotfiles with a bare repo 
    alias dotf '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

    # Start zellij
    #eval (zellij setup --generate-auto-start fish | string collect)

end
