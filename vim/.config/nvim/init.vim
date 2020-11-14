" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    init.vim                                           :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cempassi <cempassi@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2020/07/26 21:26:49 by cempassi          #+#    #+#              "
"    Updated: 2020/11/14 03:41:36 by cedricmpa        ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" Startup protection

if v:progname == 'vi'
	set noloadplugins
endif

if &compatible
	set nocompatible
endif


" General settings
scriptencoding UTF-8
set encoding=UTF-8
let &packpath = &runtimepath
set lazyredraw
set clipboard+=unnamedplus
set showcmd
set hlsearch
set hidden
set mouse=a
set scrolloff=5
set textwidth=80
set splitbelow
set ignorecase
set smartcase
set wrap linebreak nolist
set switchbuf="useopen,usetab,uselast"
set timeoutlen=500 
set relativenumber numberwidth=3
set number
set shortmess=atAOI
set autoread
set autowrite
set autowriteall
  
"" Plugin Management
"" Required:

lua require('plugins')

" Define base syntax
filetype plugin indent on
syntax on 

"Save all the files, all the times
augroup save
  au!
  au FocusLost * wall
augroup END

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

lua require'colorizer'.setup()

colorscheme deep-sea

"python configuration
let g:python_host_prog='/Users/cedricmpassi/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog='/Users/cedricmpassi/.pyenv/versions/neovim3/bin/python'

"Formating options
set formatoptions-=a    " Turn off auto formating.
set formatoptions-=t    " Turn off auto formating.
set formatoptions+=c    " Comment respect textwidth
set formatoptions+=q    " Allow formatting comments w/ gq
set formatoptions-=o    " O and o, don't continue comments
set formatoptions+=r    " But do continue when pressing enter.
set formatoptions+=n    " Indent past the formatlistpat, not underneath it.
set formatoptions+=j    " Auto-remove comments if possible.
set formatoptions-=2    " Useless option
set nojoinspaces        " Useless option 2

" Turn bell off
set belloff=all

if has('nvim')
	set signcolumn=number
endif

"Reload file after external modification
set autoread
au FocusGained * :checktime

" Map leader key
let mapleader=" "

"Persistent undo
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	" define a path to store persistent_undo files.
	let target_path = expand('~/.vim/undodir/')

	" create the directory and any parent directories
	" if the location does not exist.
	if !isdirectory(target_path)
		call mkdir(target_path, "p")
	endif

	" Point Vim to the defined undo directory.
	let &undodir = target_path

	" Enable undo persistence.
	set undofile
	set undolevels=1000
endif

" Man page reader
let $PAGER=''

" Path finding
set path=**,/usr/local/include,,

" ignore filetypes
set wildignore=*.o,*.pyc

" Remove system include from completion
set complete-=i

" Folding and windows
if has ('folding')
	if has ('windows')
		set fillchars=vert:\│ 			"Box drawing
		set fillchars+=fold:∙
		set fillchars+=eob:\ 
	endif
	set foldenable
	set foldnestmax=1
	set foldmethod=syntax
endif

" backspace
set backspace=indent,eol,start

" Default Indentation
set autoindent
set tabstop=4
set shiftwidth=4

set updatetime=300

" Remove trailing whitespaces
function! TrailingWhitespaces()
	:%s/\s\+$//ge
endfunction

autocmd BufRead,BufNewFile *.h,*.c set filetype=c

let g:colorcoder_enable_filetypes=['c', 'cpp', 'python']

"get syntax group
map <f10> :echo "hi<" . synidattr(synid(line("."),col("."),1),"name") . '> trans<'
			\ . synidattr(synid(line("."),col("."),0),"name") . "> lo<"
			\ . synidattr(synidtrans(synid(line("."),col("."),1)),"name") . ">"<cr>

map <f10> :call SynGroup()<cr>

function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

"mutt syntax
autocmd BufNewFile,BufRead *.mutt set syntax=neomuttrc

" Source vim configuration files on save
if has("autocmd")
	augroup config
		autocmd!
		autocmd BufWritePost *.vim source %
		autocmd bufwritepost .vimrc,*.vim :source $MYVIMRC
	augroup END
endif

"This autocommand jumps to the last known position in a file
"just after opening it, if the '" mark is set:

au BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
			\ |   exe "normal! g`\""
			\ | endif


" ------------------------------------- Testing -------------------------------

" Omnisharp configuration
let g:OmniSharp_server_stdio = 1

" Clap mappings
let g:clap_layout = { 'relative': 'editor' }


"" Devicons
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_denite = 1

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

nnoremap <Leader>a <cmd>lua require'telescope.builtin'.grep_string{}<CR>

au TextYankPost * silent! lua require'vim.highlight'.on_yank{"Substract", 200}

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {lua}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
	use_languagetree = false, -- Use this to enable language injection (this is very unstable)
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
  indent = {
    enable = true
  }
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
