" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cempassi <cempassi@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2019/02/06 19:37:02 by cempassi          #+#    #+#              "
"    Updated: 2019/08/02 03:18:18 by cempassi         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

if filereadable(expand("~/.config/vim/settings/mappings/normal.vim"))
	source ~/.config/vim/settings/mappings/normal.vim
endif

if filereadable(expand("~/.config/vim/settings/general.vim"))
	source ~/.config/vim/settings/general.vim
endif

if filereadable(expand("~/.config/vim/plugins/ALE.vim"))
	source ~/.config/vim/plugins/ALE.vim
endif

filetype plugin indent on
syntax on

"vundle & plugin install
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'chriskempson/base16-vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wincent/command-t'
Plugin 'pbondoer/vim-42header'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/vimproc'
Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call vundle#end()

autocmd BufRead,BufNewFile *.h,*.c set filetype=c

"easytags config
let g:easytags_async = 1
let g:easytags_events = ['BufWritePost']
let g:easytags_by_filetype = '~/.vim/tags/'
set tags=./.tags;
let g:easytags_dynamic_files = 0
set cpoptions+="d"

"remove whitespaces on save
autocmd BufWrite *h,*.c :call TrailingWhitespaces()

" syntax hilighting
highlight Error ctermbg=196
highlight ALEError ctermbg=196
match Type /\<e_[a-z]\+\>\|\<t_[a-z]\+\>\|\<s_[a-z]\+\>\|\<u_[a-z]\+\>\|\<[a-z]*_t\>/

" Automatic norme
nnoremap <silent><leader>nm :call Norme()<cr>:w<cr>

function! SpaceAfterIdentifier()
	12,$s/if (/if (/ge
	12,$s/while (/while (/ge
	12,$s/return (/return (/ge
	12,$s/break;/break ;/ge
	12,$s/return;/return ;/ge
	12,$s/\(\s*,\)\(\S\)/, \2/ge
endfunction

function! Norme()
	call SpaceAfterIdentifier()
	let @/ = ""
	echom "Normed successfully"
endfunction

" System copy-paste
vnoremap <silent><leader>y "*y
nnoremap <silent><leader>p "*p
inoremap <silent><leader>p <esc>"*pa

" CommandT mapping
nnoremap <silent><leader><cr> :CommandT<cr>

" Git
nnoremap <silent><leader>cc :bo terminal git commit -a<cr>
nnoremap <silent><leader>ss :bo terminal git status<cr>
nnoremap <silent><leader>pu :bo terminal git push<cr>

"Make shortcuts
nnoremap <silent><leader>mk :wa<cr>:bo terminal make<CR>
nnoremap <silent><leader>md :wa<cr>:bo terminal make debug<CR>
nnoremap <silent><leader>mr :wa<cr>:bo terminal make run<CR>
nnoremap <silent><leader>mf :wa<cr>:bo terminal make fclean<CR>
nnoremap <silent><leader>mc :wa<cr>:bo terminal make clean<CR>
nnoremap <silent><leader>mn :cn<CR>
nnoremap <silent><leader>mp :cp<CR>
nnoremap <silent><leader>me :cw<CR>

" autocomple binding
inoremap <silent><leader><tab><tab> <C-x><C-n>
inoremap <silent><leader><S-tab> <C-x><C-p>
inoremap <silent><leader><tab>f <C-x><C-f>
inoremap <silent><leader>] <C-x><C-]>
inoremap <silent><leader><tab>p <C-x><C-p>
inoremap <silent><leader><tab>l <C-x><C-l>
inoremap <silent><leader><tab>o <C-x><C-o>
inoremap <silent><leader>- <C-Y>
inoremap [[ <C-n>
inoremap [p <C-p>
