" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cempassi <cempassi@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2019/08/02 03:50:37 by cempassi          #+#    #+#              "
"    Updated: 2019/08/02 06:29:04 by cempassi         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if filereadable(expand("~/.vim/settings/general.vim"))
	source ~/.vim/settings/general.vim
endif

if filereadable(expand("~/.vim/settings/mappings/normal.vim"))
	source ~/.vim/settings/mappings/normal.vim
endif

if filereadable(expand("~/.vim/settings/mappings/insert.vim"))
	source ~/.vim/settings/mappings/insert.vim
endif

if filereadable(expand("~/.vim/settings/mappings/visual.vim"))
	source ~/.vim/settings/mappings/visual.vim
endif

if filereadable(expand("~/.vim/plugins/ALE.vim"))
	source ~/.vim/plugins/ALE.vim
endif

if filereadable(expand("~/.vim/plugins/airline.vim"))
	source ~/.vim/plugins/airline.vim
endif

if filereadable(expand("~/.vim/plugins/easytags.vim"))
	source ~/.vim/plugins/easytags.vim
endif

if &loadplugins
	if has('packages')
		packadd! 42header
		packadd! airline
		packadd! airline-theme
		packadd! ale
		packadd! command-t
		packadd! coc
		packadd! gutentags
		packadd! fugitive
	endif
endif

function! TrailingWhitespaces()
	:%s/\s\+$//ge
endfunction

if has("nvim")
	let g:ruby_host_prog = '/Users/cempassi/.brew/lib/ruby/gems/2.6.0/gems/neovim-0.8.1/exe/neovim-ruby-host'
endif

" System copy-paste
vnoremap <silent><leader>y "*y
nnoremap <silent><leader>p "*p
inoremap <silent><leader>p <esc>"*pa

function! Netrw_close_win()
	if &ft ==# "netrw"
		normal! :bwipe<cr>
	endif
endfunction

autocmd BufLeave * :call Netrw_close_win()

let g:netrw_browse_split = 0
autocmd BufRead,BufNewFile *.h,*.c set filetype=c
filetype plugin indent on
syntax on
