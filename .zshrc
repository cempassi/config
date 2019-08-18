# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

#Path export
export PATH=~/.cargo/bin:~/.brew/bin:~/Applications/bin:/usr/local/share:/usr/local/bin:$(getconf PATH)

ZSH_THEME=personal

bindkey -v

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx vi-mode themes zsh-syntax-highlighting)

function zle-keymap-select {
    VIMODE="${${KEYMAP/vicmd/green}/(main|viins)/blue}"
    zle reset-prompt
}

zle -N zle-keymap-select

export KEYTIMEOUT=1

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH=~/.brew/share/man/:~/Applications/valgrind/share/man/man1:~/Applications/vim/share/man/:/usr/share/man:/usr/local/share/man:/usr/X11/share/man:/Applications/Xcode.app/Contents/Developer/usr/share/man/:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/share/man/

export CDPATH=:..:~:~/Programming/42
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias ls="clear ; ls -G -l"

alias status="git status"

alias ctags="~/.brew/bin/ctags"

alias vime="vim -O4 "

alias vim="nvim "

alias norme="clear && norminette"

alias szsh="source ~/.zshrc"

alias ezsh="vim ~/.zshrc"

alias evim="vim ~/.vimrc"

alias git_tree="git log --all --graph --date=relative --pretty=format:'%C(auto,yellow)[%h][%ad]%C(auto,white) %s %C(auto, blue)%d %C(auto,red)[%an]'"

alias uconf=~/.config/update_config.sh

alias chrome="open -a /Applications/Google\ Chrome.app"

export USER=cempassi

export MAIL=cempassi@student.42.fr 

export MANPAGER="col -b | nvim -RO  '+set ft=man ts=8 nomod nolist nonu' '+nnoremap i <nop>' -"
