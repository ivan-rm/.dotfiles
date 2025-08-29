# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

###

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
#bind 'set completion-ignore-case on'

# Editor used by CLI
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

. "$HOME/.cargo/env"

# Color man pages with bat
#export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | batcat -p -lman'"

# FZF
if command -v fzf &> /dev/null; then
  if [[ -f /usr/share/bash-completion/completions/fzf ]]; then
    source /usr/share/bash-completion/completions/fzf
  fi
  if [[ -f /usr/share/doc/fzf/examples/key-bindings.bash ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
  fi
fi

# Custom key-bindings
bind '"\C-f":"tmux-sessionizer\n"'

# Prompt
export PROMPT_COMMAND=prompt_command
function prompt_command {
    local EXIT="$?"   # This needs to be first!
    ## styles and symbols
    local RESET='\[\033[0m\]'
    local BLD_RED='\[\033[1;31m\]'
    local BLD_GRN='\[\033[1;32m\]'
    local BLD_YLW='\[\033[1;33m\]'
    local BLD_BLU='\[\033[1;34m\]'
    local BLD_PPL='\[\033[1;35m\]'
    local BLD_CYA='\[\033[1;36m\]'
    local BLD_WHT='\[\033[1;37m\]'
    local ITL_YLW='\[\033[3;33m\]'
    local LSEP='('
    local RSEP=')'
    local MSEP='|'

    export PS1=""
    
    if [[ "$EXIT" == 0 ]]; then
        local arrow_color="${BLD_GRN}"
    else
        local arrow_color="${BLD_RED}"
    fi

    local git_status=$(git status --porcelain 2>/dev/null)
    if [[ $git_status != "" ]]; then
        local dirty_symbol=" "
    else
        local dirty_symbol=""
    fi

    ## Prepend contexts
    local GIT_BRANCH=$(git branch --show-current 2>/dev/null)
    [ -n "$SSH_CONNECTION" ] &&    local SSH_HOST=${BLD_WHT}'\u'${ITL_YLW}'@'${BLD_PPL}'\h'${RESET}' ' || local SSH_HOST="" 
    [ -n "$CONDA_DEFAULT_ENV" ] && PS1=${PS1}${LSEP}${ITL_YLW}${CONDA_DEFAULT_ENV}${RESET}${RSEP}
    [ -n "$VIRTUAL_ENV" ] &&       PS1=${PS1}${LSEP}${BLD_BLU}' '${BLD_YLW}${VIRTUAL_ENV##*/}${RESET}${RSEP}
    [ -n "$GUIX_ENVIRONMENT" ] &&  PS1=${PS1}${LSEP}${BLD_GRN}'GUIX'${RESET}${RSEP}
    [ -n "$GIT_BRANCH" ] &&        PS1=${PS1}${LSEP}${BLD_BLU}' '${BLD_RED}${GIT_BRANCH}${RESET}${RSEP}' '
    
    ## Merge separators, and add the path
    PS1=${PS1//${RSEP}${LSEP}/${MSEP}}
    PS1=${arrow_color}'󰁕  '${RESET}${SSH_HOST}${BLD_CYA}"\W"${RESET}' '${PS1}${RESET}${BLD_YLW}${dirty_symbol}${RESET}

    # If this is an xterm set the title to the current directory
    case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)} \w\a\]$PS1"
        ;;
    *)
        ;;
    esac
}
