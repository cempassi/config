# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

#Path export
export PATH=$HOME/.cargo/bin:$HOME/.brew/bin:$HOME/Applications/bin:/usr/local/sbin:/usr/local/bin:$(getconf PATH)

ZSH_THEME=personal

# Vi edition
bindkey -v

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git zsh-autosuggestions vi-mode zsh-syntax-highlighting rust docker)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=230'


# FROM: https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2609770
# On slow systems, checking the cached .zcompdump file to see if it must be
# regenerated adds a noticable delay to zsh startup.  This little hack restricts
# it to once a day.
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

source $ZSH/oh-my-zsh.sh

for config_file ($ZSH_CUSTOM/*.zsh(N)) source $config_file

# Pyenv setup

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

[ -s ~/.luaver/luaver ] && . ~/.luaver/luaver

