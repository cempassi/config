" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cempassi <cempassi@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2019/02/06 19:37:02 by cempassi          #+#    #+#              "
"    Updated: 2019/02/19 19:41:58 by cempassi         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

"General settings
set nocompatible
filetype plugin indent on
syntax on
set showcmd
set hlsearch
set hidden
set mouse=a
set scrolloff=5
set shortmess+=A	"Remove swap files message
set textwidth=80
set wrap linebreak nolist
set switchbuf=usetab
if exists('termguicolors')
	set termguicolors
endif

" Indentation
set autoindent
set tabstop=4
set shiftwidth=4

"folding and windows
if has ('folding')
	if has ('windows')
		set fillchars=vert:\│ 			"Box drawing
		set fillchars+=fold:∙
		hi VertSplit term=NONE cterm=NONE gui=NONE guifg=bg guibg=bg
	endif
	set foldenable
	set foldnestmax=1
	set foldmethod=syntax
endif

" Numbers
set relativenumber numberwidth=3
set number
hi LineNr ctermfg=white
hi CursorLineNr ctermfg=cyan

" Create Tags
command! MakeTags !ctags -R

"ALE config
if filereadable(".lvimrc")
    source .lvimrc
endif
let g:ale_c_parse_makefile=0
let g:ale_linters_explicit=1
let g:ale_linters={'c': ['clang']}
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_c_clang_options="-Wall -Werror -Wextra -I ~/Programming/42/libft/includes/ -I libft/includes/ -I includes/"
let airline#extensions#ale#warning_symbol = '☞  '
let airline#extensions#ale#error_symbol = '✘:'
let airline#extensions#ale#open_lnum_symbol = '[l'
let airline#extensions#ale#close_lnum_symbol = ']'

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
Plugin 'gilligan/vim-lldb'
" Plugin 'eagletmt/ghcmod-vim' Not working for now
Plugin 'Shougo/vimproc'
call vundle#end()

"Source background color
"if filereadable(expand("~/.vimrc_background"))
"let base16colorspace=256
"source ~/.vimrc_background
"endif

"Airline config
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='angr'
let g:airline_base16_improved_contrast = 1

"Haskell Config
"nnoremap <Leader>ht :GhcModType<cr>
"nnoremap <Leader>htc :GhcModTypeClear<cr>
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>
let $PATH = $PATH . ':' . expand('~/LibraryHaskell/bin')

"C shortcuts : Remember to expand with right caracter
augroup filetype_c
	autocmd!
	"expand with tab
	autocmd Filetype c iabbrev <buffer>  fun* {<cr><cr>}<up>
	"expand with *
	autocmd Filetype c iabbrev <buffer>  co* /*/<esc><left><left>
	"expand with "("
	autocmd Filetype c iabbrev <buffer> whilee while)<cr>{<cr><cr>}jk3k$i
	autocmd Filetype c iabbrev <buffer> while; while)<cr>;jkk$
	autocmd Filetype c iabbrev <buffer> fore for)<cr>{<cr><cr>}jk3k$i
	autocmd Filetype c iabbrev <buffer> for; for)<cr>;jkk$i
	autocmd Filetype c iabbrev <buffer> ife if)<cr>{<cr><cr>}jk3k$i
	autocmd Filetype c iabbrev <buffer> if; if);<left><left>
	autocmd Filetype c iabbrev <buffer> printf(" printf(");<left><left><left>
	autocmd Filetype c iabbrev <buffer> ft_printf(" ft_printf(");<left><left><left>
	autocmd Filetype c iabbrev <buffer> return return);<left><left>
	autocmd Filetype c iabbrev <buffer> ret; return ;
augroup END

"syntax hilighting
highlight Error ctermbg=196
highlight ALEError ctermbg=196
match Type /\<e_[a-z]\+\>\|\<t_[a-z]\+\>\|\<s_[a-z]\+\>\|\<u_[a-z]\+\>/

"backspace
set backspace=indent,eol,start

"leader settings
let mapleader = "-"
let maplocalleader = "_"

"change escape to jk
inoremap jk <esc>
vnoremap jk <esc>

"vimrc shortcuts
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> :echom ".vimrc sourced successfully!"<cr>

"Automatic norme
nnoremap <silent><leader>nm :call Norme()<cr>

function TrailingWhitespaces()
	:%s/\s\+$//ge
endfunction

function SpaceAfterIdentifier()
	12,$s/if(/if (/ge
	12,$s/while(/while (/ge
	12,$s/return(/return (/ge
endfunction

function Norme()
	call TrailingWhitespaces()
	call SpaceAfterIdentifier()
	let @/ = ""
	echom "Normed successfully"
endfunction

"Split
nnoremap <silent><leader>vs :vsplit<cr>
nnoremap <silent><leader>vb <C-v>

"System copy-paste
vnoremap <silent><leader>y "*y
inoremap <silent><leader>p "*p
nnoremap <silent><leader>p "*p

"CommandT mapping
nnoremap <silent><leader>t :CommandT<cr>

"Git
nnoremap <silent><leader>gu :!git commit -a<cr>
nnoremap <silent><leader>gp :!git push <cr>
nnoremap <silent><leader>gs :!git status <cr>

" save files
nnoremap <silent><leader>wa :wa<cr>
nnoremap <silent><leader>ww :w<cr>
nnoremap <silent><leader>xa :xa<cr>
nnoremap <silent><leader>qq :q<cr>
nnoremap <silent><leader>qa :qa<cr>

"Make shortcuts
nnoremap <silent><leader>mk :wa<cr>:make<CR>
nnoremap <silent><leader>md :wa<cr>:make debug<CR>
nnoremap <silent><leader>mr :wa<cr>:make re<CR>
nnoremap <silent><leader>mf :wa<cr>:make fclean<CR>
nnoremap <silent><leader>mc :wa<cr>:make clean<CR>
nnoremap <silent><leader>mn :cn<CR>
nnoremap <silent><leader>mp :cp<CR>
nnoremap <silent><leader>me :cw<CR>

" Buffer shortcuts
nnoremap <silent><leader>b :ls<cr>
nnoremap <silent><leader>bn :bn<cr>
nnoremap <silent><leader>bp :bp<cr>

" Window shortcuts
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <silent><leader>zi <C-w>_
nnoremap <silent><leader>= <C-w>=
nnoremap <silent><leader>r <C-w>r
nnoremap <silent><leader>R <C-w>R
nnoremap <silent><leader><BS> <C-w><C-x>
nnoremap <silent><leader>> <C-w>>
nnoremap <silent><leader>< <C-w><

" tab shortcuts
nnoremap <silent><leader>tt :tabs<cr>
nnoremap <silent><leader>tn :tabn<cr>
nnoremap <silent><leader>tc :tabnew<cr>
nnoremap <silent><leader>tp :tabp<cr>
nnoremap <silent><silent><leader>td :tabclose<cr>
nnoremap <silent><leader>t<F1> 1gt
nnoremap <silent><leader>t<F2> 2gt
nnoremap <silent><leader>t<F3> 3gt
nnoremap <silent><leader>t<F4> 4gt
nnoremap <silent><leader>t<F5> 5gt
nnoremap <silent><leader>t<F6> 6gt
nnoremap <silent><leader>t<F7> 7gt
nnoremap <silent><leader>t<F8> 8gt
nnoremap <silent><leader>t<F9> 9gt
nnoremap <leader>t<F0> 10gt

" autocomple binding
inoremap <silent><leader><tab> <C-x><C-n>
inoremap <silent><leader><S-tab> <C-x><C-p>
inoremap [Zf <C-x><C-f>
inoremap [Zt <C-x><C-]>
inoremap [Zp <C-x><C-p>
inoremap [Zl <C-x><C-l>
inoremap [Zo <C-x><C-o>

"File browsing
let g:netrw_banner=0		"disable file
let g:netrw_brows_split=4	"open in prior window
let g:netrw_altv=1			"open splits to the right
let g:netrw_liststyle=3 	" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"movement mapings
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
