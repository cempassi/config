"General settings
set nocompatible
filetype plugin indent on
syntax on
set showcmd
set hlsearch
set hidden
set mouse=a
set scrolloff=5
set shortmess+=AaO	"Remove swap files message
set textwidth=80
set splitbelow
set wrap linebreak nolist
set switchbuf=useopen,usetab
if exists('termguicolors')
	set termguicolors
endif

"Man page reader
let $PAGER=''

" leader settings
let mapleader = "-"
let maplocalleader = "_"

"Path finding
set path=**,/usr/include,,
set suffixesadd=.c,.h

"ignore filetypes
set wildignore=*.o

"Remove system include from completion
set complete-=i

" Numbers
set relativenumber numberwidth=3
set number
hi LineNr ctermfg=white
hi CursorLineNr ctermfg=cyan
