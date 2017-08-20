set nocompatible

"leader settings

let mapleader = "-"

let maplocalleader = "_"

"vimrc shortcuts

nnoremap <leader>ev :vsplit $MYVIMRC<cr>

nnoremap <leader>sv :source $MYVIMRC<cr>:echom ".vimrc sourced successfully!"<cr>

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

	autocmd Filetype c iabbrev <buffer> return return);<left><left>
augroup END

"change escape to jk

inoremap jk <esc>

inoremap <esc> <nop>

" save all files
nnoremap <silent><leader>wa :wa<cr>
nnoremap <silent><leader>w :w<cr>

"Make shortcuts
nnoremap <silent><leader>m :make<CR>
nnoremap <silent><leader>mn :cn<CR>
nnoremap <silent><leader>mp :cp<CR>
nnoremap <silent><leader>me :cw<CR>

" Buffer shortcuts
nnoremap <silent><leader>b :ls<cr>
nnoremap <silent><leader>bn :bn<cr>
nnoremap <silent><leader>bp :bp<cr>

" Window shortcuts
nnoremap <silent><leader><Up> :wincmd k<CR>
nnoremap <silent><leader><Down> :wincmd j<CR>
nnoremap <silent><leader><Left> :wincmd h<CR>
nnoremap <silent><leader><Right> :wincmd l<CR>
nnoremap <silent><leader>zi <C-w>_
nnoremap <silent><leader>zo <C-w>=
nnoremap <silent><leader>r <C-w>r
nnoremap <silent><leader>ow <C-w>r


" tab shortcuts
nnoremap <silent><leader>t :tabs<cr>
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
inoremap [Z<tab> <C-x><C-n>
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

"width check


"statusline configuration

	set laststatus=2
	set statusline=%r			"Read-only flag
	set statusline+=%h			"Help buffer flag
	set statusline+=%m			"Modified flag
	set statusline+=%f\  		"Name of the file
	set statusline+=Filetype:\ %y
	set statusline+=%= 			"separation point between left and right aligned items
	set statusline+=%-14.(Line\ :\%l/%L\ Col:%c%V%)\  "Line display
	set statusline+=\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}\  "Time
	set statusline+=%P\  "Position of the window

"movement mapings

onoremap p i(

onoremap in( :<c-u>normal! f(vi(<cr>

onoremap il( :<c-u>normal! F)vi(<cr>

onoremap in{ :<c-u>normal! f{vi{<cr>

onoremap il{ :<c-u>normal! F}vi{<cr>

"typo corrector
iabbrev adn and

"General settings

filetype plugin indent on

syntax on

" File finding
set path=**

set wildmenu

" Tag Jumping
command! MakeTags !ctags -R

set tabstop=4

set number numberwidth=3

set showcmd

set autoindent

set hlsearch

set foldenable

set foldnestmax=1

set foldmethod=syntax
