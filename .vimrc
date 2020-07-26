" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cempassi <cempassi@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2019/08/02 03:50:37 by cempassi          #+#    #+#              "
"    Updated: 2020/07/25 09:12:14 by cempassi         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" Startup protection

if v:progname == 'vi'
	set noloadplugins
endif

" General settings
scriptencoding UTF-8
set encoding=UTF-8
set nocompatible
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
set textwidth=80
set splitbelow
set ignorecase
set smartcase
set wrap linebreak nolist
set switchbuf="useopen,usetab"
set autoread

if exists('termguicolors')
	set termguicolors
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
set tabstop=2
set shiftwidth=2

set updatetime=300

" leader settings
nnoremap <Space> <nop>
let mapleader=" "

if &loadplugins
	if has('packages')
		packadd! 42header
		packadd! airline
		packadd! airline-theme
		packadd! coc
		packadd! coc-denite
		packadd! denite
		packadd! fugitive
		packadd! elm-syntax
		packadd! misc
		packadd! polyglot
		packadd! vim-lsp-cxx-highlight
		packadd! vim-startify
		packadd! vim-omnisharp
		packadd! vim-devicons
		packadd! defx
		packadd! defx-icons
	endif
endif


function! TrailingWhitespaces()
	:%s/\s\+$//ge
endfunction


" System copy-paste
vnoremap <silent><leader>y "*
nnoremap <silent><leader>p "*p
noremap Q <nop>

"Netrw settings
autocmd FileType netrw setl bufhidden=wipe
let g:netrw_fastbrowse=0
let g:netrw_browse_split = 0

autocmd BufRead,BufNewFile *.h,*.c set filetype=c
filetype plugin indent on
syntax on 

"Completion menu hilighting
highlight Pmenu ctermbg=16 ctermfg=111 
highlight clear SignColumn
highlight CocErrorFloat cterm=none ctermfg=9 ctermbg=none

let g:colorcoder_enable_filetypes=['c', 'cpp', 'python']

"Get syntax group
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

if has("autocmd")
	augroup config
		autocmd!
		autocmd bufwritepost .vimrc,*.vim source $MYVIMRC
	augroup END
endif

"python configuration
let g:python_host_prog='/Users/cedricmpassi/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog='/Users/cedricmpassi/.pyenv/versions/neovim3/bin/python'

" -------------------------------------- Mappings ------------------------------

" Insert mode
" change escape to jk
inoremap jk <esc>

" Visual mode
" change escape to jk
vnoremap jk <esc>

" Normal mode

" Buffer shortcuts
nnoremap <silent><leader>bn :bn<cr>
nnoremap <silent><leader>bp :bp<cr>
nnoremap <silent><leader>bd :bdelete<cr>

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

" save files and quit
nnoremap <silent><leader>ww :w<cr>
nnoremap <silent><leader>wa :wa<cr>
nnoremap <silent><leader>xx :x<cr>
nnoremap <silent><leader>xa :xa<cr>
nnoremap <silent><leader>qq :q<cr>
nnoremap <silent><leader>qa :qa<cr>

" Split window
nnoremap <silent><leader>vs :vsplit<cr>
nnoremap <silent><leader>hs :split<cr>

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
nnoremap <silent><leader>md :wa<cr>:bo terminal make debug<CR>
nnoremap <silent><leader>mr :wa<cr>:bo terminal make run<CR>
nnoremap <silent><leader>mf :wa<cr>:bo terminal make fclean<CR>
nnoremap <silent><leader>mc :wa<cr>:bo terminal make clean<CR>
nnoremap <silent><leader>mn :cn<CR>
nnoremap <silent><leader>mp :cp<CR>
nnoremap <silent><leader>me :cw<CR>

"Explore folders
nnoremap <silent><leader>E :E<cr>

" ------------------------------------- Plugins -------------------------------
"ALE config
if filereadable(".lvimrc")
	source .lvimrc
endif
let g:ale_c_parse_makefile=0
let g:ale_linters_explicit=1
let g:ale_linters={'c': ['clang'], 'python': ['flake8', 'pyre'], 'elm': ['elm_ls'] }
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_c_clang_options="-Wall -Werror -Wextra -I libft/includes/ -I includes/"

let airline#extensions#ale#warning_symbol = '☞  '
let airline#extensions#ale#error_symbol = '✘:'
let airline#extensions#ale#open_lnum_symbol = '[l'
let airline#extensions#ale#close_lnum_symbol = ']'

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
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gh :call CocAction('doHover')<cr>
nmap <silent> <leader>en <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>ci :CocInfo<cr>

"command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <silent> <leader>cf <Plug>(coc-format)


"" Coc Explorer Config


" Denite config
" Define mappings while in 'filter' mode
"   <leader>q     - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
imap <silent><buffer> <leader>q
			\ <Plug>(denite_filter_quit)
inoremap <silent><buffer><expr> <Esc>
			\ denite#do_map('quit')
nnoremap <silent><buffer><expr> <Esc>
			\ denite#do_map('quit')
inoremap <silent><buffer><expr> <CR>
			\ denite#do_map('do_action')
endfunction

" Define mappings denite
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
nnoremap <silent><buffer><expr> <CR>
			\ denite#do_map('do_action')
nnoremap <silent><buffer><expr> <leader>vs
			\ denite#do_map('do_action', 'vsplit')
nnoremap <silent><buffer><expr> d
			\ denite#do_map('do_action', 'delete')
nnoremap <silent><buffer><expr> p
			\ denite#do_map('do_action', 'preview')
nnoremap <silent><buffer><expr> q
			\ denite#do_map('quit')
nnoremap <silent><buffer><expr> i
			\ denite#do_map('open_filter_buffer')
nnoremap <silent><buffer><expr> <Space>
			\ denite#do_map('toggle_select').j
endfunction

call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Ripgrep command on grep source
call denite#custom#var('grep', {
		\ 'command': ['rg'],
		\ 'default_opts': ['-S', '--vimgrep', '--no-heading'],
		\ 'recursive_opts': [],
		\ 'pattern_opt': ['--regexp'],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight

let s:denite_options = {'default' : {
		\ 'prompt': '$',
		\ 'split': 'floating',
		\ 'floating-preview': 1,
		\ 'auto_resize': 1,
		\ 'source_names': 'short',
		\ 'direction': 'botright',
		\ 'unique': 1,
		\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
for l:fname in keys(a:opts)
	for l:dopt in keys(a:opts[l:fname])
		call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
	endfor
endfor
endfunction

call s:profile(s:denite_options)

nmap <leader>b :Denite buffer<cr>
nmap <leader>cc :Denite coc-command<cr>
nmap <leader>ce :Denite coc-extension<cr>
nmap <leader>cs :Denite coc-symbols<cr>
nmap <leader>cr :CocRestart<cr>
nmap <leader>el :Denite coc-diagnostic<cr>
nmap <leader>f :Denite -start-filter file/rec<cr>

"" Startify config
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 0
nmap <leader>sl :SLoad<cr>
nmap <leader>ss :SSave!<cr>

let g:OmniSharp_server_stdio = 1

"" Devicons
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_denite = 1

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif



"" Defx
call defx#custom#column('filename', {
            \ 'directory_icon': '⯈',
            \ 'opened_icon': '⯆',
            \ })
" Git
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 1
let g:defx_git#show_ignored = 0
let g:defx_git#raw_mode = 0

" Icons
"
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''

" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''


nnoremap <space>ee :Defx -split=floating -buffer-name="Defxr" -columns=git:indent:icons:filename:type -toggle -search=`expand('%:p')` `getcwd()`<CR>

autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('preview')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_tree', 'toggle')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> -
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

