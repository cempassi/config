" General settings
scriptencoding utf-8

set showcmd
set hlsearch
set hidden
set mouse=a
set scrolloff=5
set shortmess+=AaO	"Remove swap files message
set textwidth=80
set splitbelow
set ignorecase
set smartcase
set wrap linebreak nolist
set switchbuf=useopen,usetab
if exists('termguicolors')
	set termguicolors
endif

" Man page reader
let $PAGER=''

" Path finding
set path=**,/usr/include,,
set suffixesadd=.c,.h

" ignore filetypes
set wildignore=*.o

" Remove system include from completion
set complete-=i

" Numbers
set relativenumber numberwidth=3
set number
hi LineNr ctermfg=white
hi CursorLineNr ctermfg=cyan

" Folding and windows
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

" backspace
set backspace=indent,eol,start

" Default Indentation
set autoindent
set tabstop=4
set shiftwidth=4
