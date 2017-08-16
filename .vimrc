set nocompatible

"leader settings

let mapleader = "-"

let maplocalleader = "_"

nnoremap <leader>d dd

"vimrc shortcuts

nnoremap <leader>ev :vsplit $MYVIMRC<cr>

nnoremap <leader>sv :source $MYVIMRC<cr>:echom ".vimrc sourced successfully!"<cr>

"C shortcuts : Remember to expand with "("

augroup filetype_c
	autocmd!
	autocmd Filetype c nnoremap <buffer> <localleader>c I/*

	autocmd Filetype c inoremap <buffer> <localleader>cc */<esc>

	autocmd Filetype c iabbrev <buffer> whilee while)<cr>{<cr><cr>}jk3k$i

	autocmd Filetype c iabbrev <buffer> while; while)<cr>;jkk$

	autocmd Filetype c iabbrev <buffer> fore for)<cr>{<cr><cr>}jk3k$i

	autocmd Filetype c iabbrev <buffer> for; for)<cr>;jkk$i

	autocmd Filetype c iabbrev <buffer> ife if)<cr>{<cr><cr>}jk3k$i

	autocmd Filetype c iabbrev <buffer> if; if);<left><left>

	autocmd Filetype c iabbrev <buffer> return return);<left><left>
augroup END

"change escapte to jk

inoremap jk <esc>

inoremap <esc> <nop>

"statusline configuration

	set laststatus=2
	set statusline=%r 		"Read-only flag
	set statusline+=%h		"Help buffer flag
	set statusline+=%m		"Modified flag
	set statusline+=%f\  "Name of the file
	set statusline+=Filetype:\ %y
	set statusline+=%= "separation point between left and right aligned items
	set statusline+=%-14.(Line\ :\%l/%L\ Col:%c%V%)\  "Line display
	set statusline+=\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}\  "Time
	set statusline+=%P\  "Percentage of the file on screen

"movement mapings

onoremap p i(

onoremap in( :<c-u>normal! f(vi(<cr>

onoremap il( :<c-u>normal! F)vi(<cr>

onoremap in{ :<c-u>normal! f{vi{<cr>

onoremap il{ :<c-u>normal! F}vi{<cr>

"typo corrector
iabbrev adn and

syntax enable

set tabstop=4

set number numberwidth=3

set showcmd

filetype plugin indent on

set autoindent

set wildmenu

set hlsearch

set foldenable

set foldnestmax=1

set foldmethod=syntax
