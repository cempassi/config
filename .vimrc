" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cempassi <cempassi@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2019/08/02 03:50:37 by cempassi          #+#    #+#              "
"    Updated: 2019/10/15 14:11:20 by cempassi         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

if v:progname == 'vi'
  set noloadplugins
endif

set nocompatible
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set lazyredraw

set updatetime=300

" leader settings
let mapleader="-"
let maplocalleader="_"

if &loadplugins
	if has('packages')
		packadd! 42header
		packadd! airline
		packadd! airline-theme
		packadd! coc
		packadd! denite
		packadd! fugitive
		packadd! elm-syntax
		packadd! misc
		packadd! polyglot
	endif
endif

function! TrailingWhitespaces()
	:%s/\s\+$//ge
endfunction


" System copy-paste
vnoremap <silent><leader>y "*
nnoremap <silent><leader>p "*p
inoremap <silent><leader>p <esc>"*pa

autocmd FileType netrw setl bufhidden=wipe
let g:netrw_fastbrowse=0
let g:netrw_browse_split = 0

autocmd BufRead,BufNewFile *.h,*.c set filetype=c
filetype plugin indent on
syntax on 

"Completion menu hilighting
highlight Pmenu ctermbg=16 ctermfg=111 
highlight clear SignColumn
highlight CocErrorFloat cterm=none ctermfg=9 ctermbg=none

let g:colorcoder_enable_filetypes=['c', 'cpp', 'python']

"Get syntax group
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

if has("autocmd")
	augroup config
		autocmd!
  		autocmd bufwritepost .vimrc,*.vim source $MYVIMRC
	augroup END
endif
