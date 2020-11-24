" -------------------------------------- Mappings ------------------------------

" leader settings
nnoremap <Space> <nop>

" change escape to jk
inoremap jk <esc>
cnoremap jk <C-c>
tnoremap jk <C-\><C-n>
vnoremap jk <esc>

"Close surrondings
inoremap <> <><Left>
inoremap (( ()<Left>
inoremap {{ {}<Left>
inoremap [[ []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

" Accents and special characters
inoremap <silent>,. <C-k>

" No arrow keys
inoremap <right> <nop>
inoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" Normal mode

"Invert colon and semicolon
nnoremap ; :
nnoremap , ;

" Remap next/previous f or t
nnoremap <Bslash> ,
vnoremap ; :
vnoremap , ;
vnoremap <Bslash> ,

" Buffer shortcuts
nnoremap <silent><tab> :bn<cr>
nnoremap <silent><S-tab> :bp<cr>
nnoremap <silent><leader>bd :bp\|bdelete! #<cr>

" Previous buffer
nnoremap <silent><leader>p <C-^>

" File exploration
nnoremap <silent><leader>fe :Dirvish<CR>

" Registers 
nnoremap <silent><leader>re i<C-r>
nnoremap <silent><leader>rp i<C-r>0<esc>
nnoremap <silent><Leader>rc :let @a=@" \| let @"=@+ \| let @+=@a<CR>

" Window shortcuts
" Move between windows
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>

"Scroll window
nnoremap <silent><leader>mf <C-f>
nnoremap <silent><leader>mb <C-b>
nnoremap <silent><leader>mu <C-u>
nnoremap <silent><leader>md <C-d>

" Shift panes to horizontal or vertical
nnoremap <silent><leader>H <C-w>K
nnoremap <silent><leader>V <C-w>H
nnoremap <silent><leader>= <C-w>=

"Toogle scrolloff
nnoremap <silent><Leader>_ :let &scrolloff=999-&scrolloff<CR>

"Shift window
nnoremap <silent><leader><BS> <C-w><C-x>
nnoremap <silent><leader>> <C-w>r
nnoremap <silent><leader>< <C-w>R
nnoremap <silent><leader>O <C-w>o

"Sane line moves
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Unmap Q
noremap Q <nop>

" save files and quit
nnoremap <silent><leader>x :x<cr>
nnoremap <silent><leader>q :q<cr>
nnoremap <silent><leader>Q :qa!<cr>

" Redo
nnoremap <silent><leader>u <c-r>

" Split window
nnoremap <silent><leader>vs :vsplit<cr>
nnoremap <silent><leader>hs :split<cr>

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

" Goyo
nnoremap <silent> <leader>zz :Goyo<cr>

" Coc
nnoremap <silent> <leader>c<leader> :Clap coc_commands<cr> 
nnoremap <silent> <leader>x<leader> :Clap coc_extensions<cr>
nnoremap <silent> <leader>s<leader> :Clap coc_symbols<cr>

" Language server mappings
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>ct <Plug>(coc-type-definition)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-references)
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)

" Formating
nmap <silent> <leader>cf <Plug>(coc-format)

" Apply AutoFix to problem on the current line.
nmap <silent> <leader>ef  <Plug>(coc-fix-current)

" Symbol renaming.
nmap <silent> <leader>cn <Plug>(coc-rename)

" Rust InlayHints togle
nmap <silent> <leader>ch :CocCommand rust-analyzer.toggleInlayHints<cr>

" Highlight the symbol and its references when holding the cursor.
nmap <silent> <leader>* :call CocActionAsync('highlight')<cr>

" Git
nnoremap <silent> <leader>d<leader> :Clap git_diff_files<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gc :Git commit<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gf :Git fetch<cr>

"Gitgutter
nmap <leader>ge :GitGutterToggle<cr>
nmap <leader>gh :GitGutterLineHighlightsToggle<cr>

"Preview hunk
nmap <leader>g? <Plug>(GitGutterPreviewHunk)

"Stage or undo hunk
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)

"Move between hunks
nmap <leader>gj <Plug>(GitGutterNextHunk)
nmap <leader>gk <Plug>(GitGutterPrevHunk)

"Hunk text object
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

" Vim internals
nnoremap <silent> <leader>r<lealder> :Clap registers<cr>
nnoremap <silent><leader>y<leader> :Clap yanks<cr>
nnoremap <silent><leader>m<leader> :Clap maps<cr>

" Errors mappings
nnoremap <silent> <leader>e<leader> :Clap coc_diagnostics<cr>

" Find mapping
nnoremap <silent> <leader>fb :Clap blines<cr>
nnoremap <silent> <leader>fl :Clap lines<cr>
nnoremap <silent> <leader>fj :Clap jumps<cr>

" Floaterm 
nnoremap   <silent>   <leader>tc    :FloatermNew<CR>
tnoremap   <silent>   <leader>tc    <C-\><C-n>:FloatermNew<CR>
tnoremap   <silent>   <leader>q    <C-\><C-n>:FloatermKill<CR>
nnoremap   <silent>   <leader>tp    :FloatermPrev<CR>
tnoremap   <silent>   <leader>tp    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <leader>tn    :FloatermNext<CR>
tnoremap   <silent>   <leader>tn    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <leader><leader>   :FloatermToggle<CR>
tnoremap   <silent>   <leader><leader>   <C-\><C-n>:FloatermToggle<CR>

" Session
nmap <leader>sl :SLoad<cr>
nmap <leader>ss :SSave!<cr>

" AsyncTask 
nnoremap <silent><leader>mk :AsyncTask build<cr>
nnoremap <silent><leader>mc :AsyncTask clean<cr>
nnoremap <silent><leader>mr :AsyncTask run<cr>
nnoremap <silent><leader>mt :AsyncTask test<cr>
nnoremap <silent><leader>me :AsyncTask -e<cr><cr>
nnoremap <silent><leader>mE :AsyncTask -E<cr><cr>
nnoremap <silent><leader>mn :cn<CR>
nnoremap <silent><leader>mp :cp<CR>
nnoremap <silent><leader>mw :cw<CR>

" Comment
nnoremap <Leader>cm <Esc>:set opfunc=DoCommentOp<CR>g@
nnoremap <Leader>C <Esc>:set opfunc=UnCommentOp<CR>g@
vnoremap <Leader>cm <Esc>:call CommentMark(1,'<','>')<CR>
vnoremap <Leader>C <Esc>:call CommentMark(0,'<','>')<CR>

" CHADtree
nnoremap _ :CHADopen<cr>

" Corpus notes
nmap <leader>n <Plug>(Corpus)
