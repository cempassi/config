" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cempassi <cempassi@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2019/02/06 19:37:02 by cempassi          #+#    #+#              "
"    Updated: 2019/08/01 23:27:50 by cempassi         ###   ########.fr        "
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

autocmd BufRead,BufNewFile *.h,*.c set filetype=c

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

"easytags config
let g:easytags_async = 1
let g:easytags_events = ['BufWritePost']
let g:easytags_by_filetype = '~/.vim/tags/'
set tags=./.tags;
let g:easytags_dynamic_files = 2
set cpoptions+="d"

"deoplete config
let g:deoplete#enable_at_startup = 1

"remove whitespaces on save
autocmd BufWrite *h,*.c :call TrailingWhitespaces()

" syntax hilighting
highlight Error ctermbg=196
highlight ALEError ctermbg=196
match Type /\<e_[a-z]\+\>\|\<t_[a-z]\+\>\|\<s_[a-z]\+\>\|\<u_[a-z]\+\>\|\<[a-z]*_t\>/

" backspace
set backspace=indent,eol,start

" Old cursor
nnoremap <silent><leader>o <C-o>
nnoremap <silent><leader>i <C-i>

"Jump between errors
nnoremap <silent><leader>en :ALENext<cr>
nnoremap <silent><leader>ep :ALEPrevious<cr>

" change escape to jk
inoremap jk <esc>
vnoremap jk <esc>

"vsplit
nnoremap <leader>vs :vsplit<cr>

"visual block
nnoremap <leader>vb <C-v>

" vimrc shortcuts
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> :echom ".vimrc sourced successfully!"<cr>

" Automatic norme
nnoremap <silent><leader>nm :call Norme()<cr>:w<cr>

function! TrailingWhitespaces()
	:%s/\s\+$//ge
endfunction

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

"Clever tab
"function! CleverTab()
"	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"	return "\<Tab>"
"else
"	return "\<C-N>"
"endif
"endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR>

"Visual Block
nnoremap <silent><leader>vb <C-v>

"Tag
nnoremap <silent><leader>gf <C-]>zz
nnoremap <silent><leader>gt <C-t>zz
nnoremap <silent><leader>gg :tn<cr>zz
nnoremap <silent><leader>gs <C-w>}
nnoremap <silent><leader>gn :ptnext<cr>
nnoremap <silent><leader>gd :pc<cr>

"delete previous hilighting turn of hilighting
nnoremap <silent><leader>nh :let @/ = ""<cr>

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
