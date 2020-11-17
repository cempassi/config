# Dotfiles

My configuration files, managed with Stow. Constant work in progress!

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
- Have one <leader> + key for a group of functionalites, not by plugin
- Mappings have to play well with vim's modal logic
- Be as conservative as possible with plugins that I keep

# Sources

I'm always looking for a better way to use neovim and stole ideas in other
people's configurations, watch content, read blogposts. So thanks to everyone taking the time to
share, special mentions:

[Greg Hurell](https://github.com/wincent/wincent)
[TJDeVries](https://www.twitch.tv/teej_dv)
[The Primagen](https://www.youtube.com/c/ThePrimeagen)
[ChrisAtMachine](https://www.youtube.com/playlist?list=PLhoH5vyxr6QqPtKMp03pcJd_Vg8FZ0rtg)
[Vim Conf](https://www.youtube.com/playlist?list=PLcTu2VkAIIWzD2kicFNHN2c35XQCeZdsv)
