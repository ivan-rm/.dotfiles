if status is-interactive
    # Commands to run in interactive sessions can go here

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
        #fzf --fish | source
    end

    # Editor used by CLI
    set -gx EDITOR nvim
    set -gx SUDO_EDITOR $EDITOR

    # Color man pages with bat
    set -gx MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | batcat -p -lman'"

    # File system
    abbr ls 'eza -lh --group-directories-first --icons=auto'
    abbr la 'eza -lha --group-directories-first --icons=auto'
    abbr lt 'eza --tree --level=2 --long --icons --git'
    abbr l 'eza -bGF --header --git --color=always --group-directories-first --icons'
    abbr ll 'eza -la --icons --octal-permissions --group-directories-first'
    abbr lta 'eza -a --tree --level=2 --long --icons --git'
    abbr ff "fzf --preview 'batcat --style=numbers --color=always {}'"
    abbr fd fdfind
    abbr cd z

    # Directories
    abbr .. 'cd ..'
    abbr ... 'cd ../..'
    abbr .... 'cd ../../..'

    # Tools
    abbr code 'code --enable-features=UseOzonePlatform --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto'
    abbr n nvim
    abbr g git
    abbr d docker
    abbr bat batcat
    abbr lzg lazygit
    abbr lzd lazydocker
    abbr python python3
    abbr pip pip3
    #abbr zj zellij

    # Git 
    abbr gst 'git status -sb'
    abbr gcm 'git commit -m'
    abbr gcam 'git commit -a -m'
    abbr gcad 'git commit -a --amend'

    # Managing dotfiles with a bare repo 
    abbr dotf '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

    # Start zellij
    #eval (zellij setup --generate-auto-start fish | string collect)

end
