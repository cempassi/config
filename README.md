# Dotfiles

My configuration files, managed with Stow. Constant work in progress!

![Capture d’écran 2020-11-29 à 16 09 05](https://user-images.githubusercontent.com/25014717/100999754-681e9f00-355d-11eb-8a6c-6fc150af1ad7.png)

## Table of contents

- [General info](#general-info)
- [Neovim configuration](#neovim-configuration)
- [Sources](#sources)

## General info

I'm working on MacOS but i plan to make my configuration portable to linux. I use
the following tools:

- [Alacritty](https://github.com/alacritty/alacritty)
- Zsh
- Tmux
- Neovim

I also replaced most of the basic unix utils with Rust equivalents.

## Neovim configuration

I switched definitively to neovim this year, so I do not take into account vim
compatibility. I rely as much as possible on floating windows and mappings, to
stay as much as possible in my editor. My goal really is to achieve as much as
possible with as little as i can. So there's a core logic to my setup that I generaly try to stick to:

- Explore the default possibilities before looking for a plugin
- Personnal mapping taking more keystrokes than regular one are dismissed...
- But avoid using ctrl as much as possible
- Have one `<leader> + key` for a group of functionalites, not by plugin
- Mappings have to play well with vim's modal logic
- Be as conservative as possible with plugins that I keep

## Credit

Deep thanks to the vim/neovim community.
