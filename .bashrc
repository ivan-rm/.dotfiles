function prompt_command {
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
    ##

    export PS1=""
    ## Prepend contexts
    local GIT_BRANCH=$(git branch --show-current 2>/dev/null)
    [ -n "$SSH_CONNECTION" ] && PS1=${PS1}${BLD_WHT}'\u'${ITL_YLW}'@'${BLD_PPL}'\h'${RESET}
    [ -n "$CONDA_DEFAULT_ENV" ] && PS1=${PS1}${BLD_BLU}${LSEP}${ITL_YLW}${CONDA_DEFAULT_ENV}${BLD_BLU}${RSEP}
    [ -n "$VIRTUAL_ENV" ] && PS1=${PS1}${BLD_BLU}${LSEP}${BLD_YLW}${VIRTUAL_ENV##*/}${BLD_BLU}${RSEP}
    [ -n "$GUIX_ENVIRONMENT" ] && PS1=${PS1}${BLD_BLU}${LSEP}${BLD_YLW}'GUIX'${BLD_BLU}${RSEP}
    [ -n "$GIT_BRANCH" ] && PS1=${PS1}${BLD_BLU}${LSEP}${BLD_RED}${GIT_BRANCH}${BLD_BLU}${RSEP}
    ## Truncate the path
    local trunc_len=25 ## shorten dirs if less than this
    local short_dir=$(pwd | sed -r "s|^${HOME}|~|")
    [[ ${#short_dir} > $trunc_len ]] && short_dir=$(sed -r 's|([^/]{3})[^/]+/|\1/|g' <<<"${short_dir}")
    ## Merge separators, and add the truncated path
    PS1=${PS1//"${RSEP}${BLD_BLU}${LSEP}"/${BLD_BLU}${MSEP}}
    PS1=${BLD_CYA}${short_dir}' '${PS1}${RESET}$' ▶ '
}

export PROMPT_COMMAND=prompt_command
