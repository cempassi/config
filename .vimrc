set nocompatible

"leader settings

let mapleader = "-"

let maplocalleader = "_"

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

"change change to jk

inoremap jk <esc>

inoremap <esc> <nop>

"Make shortcuts
nnoremap <leader>m :make<CR>
nnoremap <leader>mn :cn<CR>
nnoremap <leader>mp :cp<CR>
nnoremap <leader>me :cw<CR>

" Buffer shortcuts
nnoremap <leader>b :ls<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

" Window shortcuts
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Right> :wincmd l<CR>
nnoremap <leader>z <c-w>_

" tab shortcuts
nnoremap <leader>t :tabs<cr>
nnoremap <leader>tn :tabn<cr>
nnoremap <leader>tc :tabnew<cr>
nnoremap <leader>tp :tabp<cr>
nnoremap <leader>td :tabclose<cr>
nnoremap <leader>t<F1> 1gt
nnoremap <leader>t<F2> 2gt
nnoremap <leader>t<F3> 3gt
nnoremap <leader>t<F4> 4gt
nnoremap <leader>t<F5> 5gt
nnoremap <leader>t<F6> 6gt
nnoremap <leader>t<F7> 7gt
nnoremap <leader>t<F8> 8gt
nnoremap <leader>t<F9> 9gt
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
	set statusline+=%P\  "Percentage of the file on screen

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

syntax enable

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
