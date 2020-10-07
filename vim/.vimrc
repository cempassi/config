" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cempassi <cempassi@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2020/07/26 21:26:49 by cempassi          #+#    #+#              "
"    Updated: 2020/10/07 02:48:43 by cempassi         ###   ########.fr        "
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
set clipboard+=unnamed
set showcmd
set hlsearch
set hidden
set mouse=a
set scrolloff=5
set shortmess+=AaO	"Remove swap files message
set textwidth=0
set splitbelow
set ignorecase
set smartcase
set wrap linebreak nolist
set switchbuf="useopen,usetab"
set timeoutlen=500

" Define base syntax
filetype plugin indent on
syntax on 

"Reload file after external modification
set autoread
au FocusGained * :checktime

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
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('sheerun/vim-polyglot')
	call dein#add('liuchengxu/vim-clap', {'build': 'make'})
	call dein#add('tpope/vim-fugitive', {'lazy': 1})
	call dein#add('liuchengxu/vim-which-key')
	call dein#add('mhinz/vim-startify')
	call dein#add('ryanoasis/vim-devicons')
	call dein#add('jackguo380/vim-lsp-cxx-highlight')
	call dein#add('honza/vim-snippets')
	call dein#add('vimwiki/vimwiki')
	call dein#add('junegunn/goyo.vim')
	"call dein#add('Shougo/neosnippet-snippets')

	" Required:
	call dein#end()
	call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

"End dein Scripts-------------------------

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
set path=**,/usr/include,,
set suffixesadd=.c,.h

" ignore filetypes
set wildignore=*.o,*.pyc
let g:netrw_list_hide= '.*\.swp$, *.pyc'
let g:netrw_hide = 1

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

" leader settings
nnoremap <Space> <nop>
let mapleader=" "

" Remove trailing whitespaces
function! TrailingWhitespaces()
	:%s/\s\+$//ge
endfunction

"Netrw settings
autocmd FileType netrw setl bufhidden=wipe
let g:netrw_fastbrowse = 0
let g:netrw_browse_split = 0

autocmd BufRead,BufNewFile *.h,*.c set filetype=c

"Completion menu hilighting
highlight Pmenu ctermbg=16 ctermfg=111 
highlight clear SignColumn
highlight CocErrorFloat cterm=none ctermfg=8 ctermbg=none

let g:colorcoder_enable_filetypes=['c', 'cpp', 'python']

"Get syntax group
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"mutt syntax
autocmd BufNewFile,BufRead *.mutt set syntax=neomuttrc

if has("autocmd")
	augroup config
		autocmd!
		autocmd bufwritepost .vimrc,*.vim source $MYVIMRC
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

" -------------------------------------- Mappings ------------------------------

" Insert mode
" change escape to jk
inoremap jk <esc>

"Close surrondings
inoremap <> <><Left>
inoremap (( ()<Left>
inoremap {{ {}<Left>
inoremap [[ []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

"Sane line moves
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Visual mode
" change escape to jk
vnoremap jk <esc>

" System copy-paste
vnoremap <silent><leader>y "*
nnoremap <silent><leader>p "*p
noremap Q <nop>

" Normal mode

" Buffer shortcuts
nnoremap <silent><leader>bn :bn<cr>
nnoremap <silent><leader>bp :bp<cr>
nnoremap <silent><leader>bd :bp\|bdelete! #<cr>

" File exploration
nnoremap <silent><leader>fe :e.<CR>
nnoremap <silent><leader>fE :Ex<CR>

" Window shortcuts
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <silent><leader>mf <C-f>
nnoremap <silent><leader>mb <C-b>
nnoremap <silent><leader>mu <C-u>
nnoremap <silent><leader>md <C-d>
nnoremap <silent><leader>zi <C-w>_
nnoremap <silent><leader>= <C-w>=
nnoremap <silent><leader>r <C-w>r
nnoremap <silent><leader>R <C-w>R
nnoremap <silent><leader><BS> <C-w><C-x>
nnoremap <silent><leader>> <C-w>>
nnoremap <silent><leader>< <C-w><

" save files and quit
nnoremap <silent><leader>xx :w<cr>
nnoremap <silent><leader>xd :w\|bdelete<cr>
nnoremap <silent><leader>xa :xa<cr>
nnoremap <silent><leader>qq :q!<cr>
nnoremap <silent><leader>qa :qa!<cr>


" Split window
nnoremap <silent><leader>vs :vsplit<cr>
nnoremap <silent><leader>hs :split<cr>

" tab shortcuts
nnoremap <silent><leader>tt :tabs<cr>
nnoremap <silent><leader>tn :tabn<cr>
nnoremap <silent><leader>tc :tabnew<cr>
nnoremap <silent><leader>tp :tabp<cr>
nnoremap <silent><silent><leader>td :tabclose<cr>

" Old cursor
nnoremap <silent><leader>o <C-o>
nnoremap <silent><leader>i <C-i>

"visual block
nnoremap <leader>vb <C-v>

" vimrc shortcuts
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr> :echom ".vimrc sourced successfully!"<cr>

"delete previous hilighting turn of hilighting
nnoremap <silent><leader>nh :let @/ = ""<cr>

"Make shortcuts
nnoremap <silent><leader>mk :wa<cr>:bo terminal make<CR>
nnoremap <silent><leader>mc :wa<cr>:bo terminal make clean<CR>
nnoremap <silent><leader>mn :cn<CR>
nnoremap <silent><leader>mp :cp<CR>
nnoremap <silent><leader>me :cw<CR>

" ------------------------------------- Plugins -------------------------------
"Airline config
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='angr'
let g:airline_base16_improved_contrast = 1
let g:airline_extensions = ['coc']

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1

" Coc Config
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"Coc mappings
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>ct <Plug>(coc-type-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)
nmap <silent> <leader>ch :call CocAction('doHover')<cr>
let g:coc_snippet_next = '<leader>sn'
let g:coc_snippet_prev = '<leader>sp'

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <silent> <leader>cf <Plug>(coc-format)

" Highlight the symbol and its references when holding the cursor.
nmap <silent> <leader>* :call CocActionAsync('highlight')<cr>

" Clap mappings
let g:clap_layout = { 'relative': 'editor' }
let g:clap_provider_grep_opts =  '-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'
nnoremap <silent> <leader>bb :Clap buffers<cr>
nnoremap <silent> <leader>cc :Clap coc_commands<cr>
nnoremap <silent> <leader>ce :Clap coc_extensions<cr>
nnoremap <silent> <leader>cs :Clap coc_symbols<cr>

" Errors mappings
nnoremap <silent> <leader>el :Clap coc_diagnostics<cr>
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)

" Find mapping
nnoremap <silent> <leader>ff :Clap files<cr>
nnoremap <silent> <leader>fb :Clap blines<cr>
nnoremap <silent> <leader>fl :Clap lines<cr>
nnoremap <silent> <leader>fj :Clap jumps<cr>

" Startify config
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 0
nmap <leader>sl :SLoad<cr>
nmap <leader>ss :SSave!<cr>

" Omnisharp configuration
let g:OmniSharp_server_stdio = 1

"" Devicons
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_denite = 1

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

" VimWiki
let g:vimwiki_global_ext = 0
let g:vimwiki_table_mappings = 0 "tab completion
let g:vimwiki_dir_link = 'index'
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown'}
let g:vimwiki_root = '~/Wiki'
let g:vimwiki_list = [
			\{'path': '~/Wiki', 'syntax': 'markdown', 'diary_rel_path': 'Diary',
				\'diary_index': 'index', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Tools',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Languages',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Languages/Bash',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Languages/C',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Languages/C++',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Languages/Python',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Languages/Rust',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'}]

" Goyo
nnoremap <silent> <leader>zz :Goyo<cr>

"Color Settings
if exists('termguicolors')
	set termguicolors
endif


" Vim which Key

let g:which_key_vertical = 0


let g:which_key_map = {}

let g:which_key_map.b = {
			\ 'name': '+Buffers',
			\ 'b': ['<leader>bl', 'List all Buffers'],
			\ 'n': ['<leader>bn', 'Go to Next Buffer'],
			\ 'p': ['<leader>bp', 'Go to Previous Buffer'],
			\ 'd': ['<leader>bd', 'Delete buffer'],
			\}


let g:which_key_map.c = {
			\ 'name': '+Coc/Clap',
			\ 'c': ['<leader>cc', 'List Coc Commands'],
			\ 'd': ['<leader>cd', 'Go to Definition'],
			\ 'h': ['<leader>ch', 'Hover'],
			\ 't': ['<leader>ct', 'Go to Type definition'],
			\ 'i': ['<leader>ci', 'Go to Implementation'],
			\ 'r': ['<leader>cr', 'List References'],
			\ 'e': ['<leader>ce', 'List Coc Extensions'],
			\ 's': ['<leader>cs', 'List Coc Symbols'],
			\}

let g:which_key_map.f = {
			\ 'name': '+Find',
			\ 'e': ['<leader>fe', 'Explore from project root'],
			\ 'E': ['<leader>fE', 'Explore from current'],
			\ 'f': ['<leader>ff', 'Find file'],
			\ 'b': ['<leader>cd', 'Find in Buffer'],
			\ 'l': ['<leader>ch', 'Find in all lines'],
			\ 'j': ['<leader>ct', 'Find in all Jumps'],
			\}

let g:which_key_map.e = {
			\ 'name': '+Errors',
			\ 'l': ['<leader>el', 'List Errors and Warnings'],
			\ 'n': ['<leader>en', 'Go to Next Error'],
			\ 'p': ['<leader>np', 'Go to Previous Error'],
			\}

let g:which_key_map.x = {
			\ 'name': '+Save',
			\ 'x': ['<leader>xx', 'Save current'],
			\ 'd': ['<leader>xd', 'Save and Delete'],
			\ 'a': ['<leader>xa', 'Save all and Quit'],
			\}

call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
