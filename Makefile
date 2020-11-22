all: check

APP += git
APP += neovim
APP += alacritty
APP += lldb
APP += mbsync
APP += msmtp
APP += neomutt
APP += scripts
APP += tmux
APP += zsh

install:
	stow -Sv -t ~ $(APP)

check: 
	stow -nSv -t ~ $(APP)
