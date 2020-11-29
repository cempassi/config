export USER=cedricmpassi

export MAIL=cempassi@student.42.fr 

export PYENV_ROOT=$HOME/.pyenv

export PATH=$PYENV_ROOT/bin:$PATH:./node_modules/.bin

export MANPAGER="col -b | nvim -RO  '+set ft=man ts=8 nomod nolist nonu' '+nnoremap i <nop>' -"

export LSCOLORS="exfxcxdxbxegedabagacad"

export VISUAL="nvim"

export EDITOR="nvim"

export CDPATH=:..:~:~/Programming:~/Programming/42:~/Programming/Web:~/Programming/C:~/Programming/nvim

export BAT_THEME=Nord

export SSH_KEY_PATH="~/.ssh/rsa_id"

export KEYTIMEOUT=1

export GPG_TTY=${TTY}

export LS_COLORS="$(vivid generate solarized-dark)"

source ~/.oh-my-zsh/custom/secrets.zsh
