# Comment

#Vim mode color Autoupdate

function zle-keymap-select {
    VIMODE="${${KEYMAP/vicmd/green}/(main|viins)/blue}"
    zle reset-prompt
}

zle -N zle-keymap-select

PERSONAL_DATE="%{$fg[yellow]%}%D %T%{$reset_color%}"
PROMPT='%{$fg[$VIMODE]%}[%c] %{$reset_color%}'

RPROMPT='$(git_prompt_status)%{$reset_color%} %{$fg[cyan]%}$(git_prompt_info)%{$reset_color%} [$PERSONAL_DATE]'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%} ✱"
