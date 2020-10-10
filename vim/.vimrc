" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cempassi <cempassi@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2020/07/26 21:26:49 by cempassi          #+#    #+#              "
"    Updated: 2020/10/10 05:33:43 by cedricmpa        ###   ########.fr        "
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
set runtimepath^=~/.vim runtimepath+=~/.vim/after
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
set switchbuf="useopen,usetab"
set timeoutlen=500 
set relativenumber numberwidth=3
set number
set shortmess=atAOI 	" No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts

set formatoptions-=a    " Turn off auto formating.
set formatoptions-=t    " Turn off auto formating.
set formatoptions+=c    " In general, I like it when comments respect textwidth
set formatoptions+=q    " Allow formatting comments w/ gq
set formatoptions-=o    " O and o, don't continue comments
set formatoptions+=r    " But do continue when pressing enter.
set formatoptions+=n    " Indent past the formatlistpat, not underneath it.
set formatoptions+=j    " Auto-remove comments if possible.
set formatoptions-=2    " Useless option
set nojoinspaces        " Useless option 2

"" Plugin Management
"" Required:
set runtimepath+=/Users/cedricmpassi/.cache/dein/repos/github.com/Shougo/dein.vim

"" Remove tilde at end of file

"" Required:
if dein#load_state('/Users/cedricmpassi/.cache/dein')
	call dein#begin('/Users/cedricmpassi/.cache/dein')

	" Let dein manage dein
	" Required:
	call dein#add('/Users/cedricmpassi/.cache/dein/repos/github.com/Shougo/dein.vim')

	" Add or remove your plugins here like this:
	call dein#add('wsdjeg/dein-ui.vim')
	call dein#add('neoclide/coc.nvim', {'rev': 'release'})
	call dein#add('vn-ki/coc-clap')
	call dein#add('pbondoer/vim-42header')
	call dein#add('vim-airline/vim-airline')
	call dein#add('sheerun/vim-polyglot')
	call dein#add('liuchengxu/vim-clap', {'build': 'make'})
	call dein#add('tpope/vim-fugitive', {'lazy': 1})
	call dein#add('liuchengxu/vim-which-key')
	call dein#add('mhinz/vim-startify')
	call dein#add('vimwiki/vimwiki')
	call dein#add('junegunn/goyo.vim')
	call dein#add('wellle/targets.vim')
	call dein#add('justinmk/vim-dirvish.git')
	call dein#add('nvim-lua/popup.nvim')
	call dein#add('nvim-lua/plenary.nvim')
	call dein#add('nvim-lua/telescope.nvim')
	call dein#add('vim-airline/vim-airline-themes')

	"call dein#add('ryanoasis/vim-devicons')
	"call dein#add('jackguo380/vim-lsp-cxx-highlight')
	"call dein#add('honza/vim-snippets')
	" Required:
	call dein#end()
	call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif



"End dein Scripts-------------------------

" Turn bell off
set belloff=all

" Define base syntax
filetype plugin indent on
syntax on 

if has('nvim')
	set signcolumn = number
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

" Numbers
hi LineNr ctermfg=white
hi CursorLineNr ctermfg=cyan

" Folding and windows
if has ('folding')
	if has ('windows')
		set fillchars=vert:\│ 			"Box drawing
		set fillchars+=fold:∙
		set fillchars+=eob:\ 
		hi VertSplit term=NONE cterm=NONE gui=NONE guifg=bg guibg=bg
	endif
	set foldenable
	set foldnestmax=3
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

" "Netrw settings
" autocmd FileType netrw setl bufhidden=wipe
" let g:netrw_list_hide= '.*\.swp$, *.pyc'
" let g:netrw_hide = 1
" let g:netrw_fastbrowse=0
" let g:netrw_browse_split = 0
" 
autocmd BufRead,BufNewFile *.h,*.c set filetype=c

let g:colorcoder_enable_filetypes=['c', 'cpp', 'python']

"Get syntax group
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"mutt syntax
autocmd BufNewFile,BufRead *.mutt set syntax=neomuttrc

autocmd BufWritePost *.vim source %

if has("autocmd")
	augroup config
		autocmd!
		autocmd bufwritepost .vimrc,*.vim :source $MYVIMRC
	augroup END
endif

"This autocommand jumps to the last known position in a file
"just after opening it, if the '" mark is set:

au BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
			\ |   exe "normal! g`\""
			\ | endif

"python configuration
let g:python_host_prog='/Users/cedricmpassi/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog='/Users/cedricmpassi/.pyenv/versions/neovim3/bin/python'


" ------------------------------------- Plugins -------------------------------


" Omnisharp configuration
let g:OmniSharp_server_stdio = 1

"" Devicons
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_denite = 1

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

nnoremap <Leader>p <cmd>lua require'telescope.builtin'.grep_string{}<CR>
nnoremap <Leader>p <cmd>lua require'telescope.builtin'.find_text{}<CR>

au TextYankPost * silent! lua require'vim.highlight'.on_yank{"Substract", 200}
