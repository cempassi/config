" -------------------------------------- Mappings ------------------------------

" leader settings
nnoremap <Space> <nop>

" Insert mode
" change escape to jk
inoremap jk <esc>
cnoremap jk <C-c>

nnoremap ; :
nnoremap , ;
nnoremap <Bslash> ,
vnoremap ; :
vnoremap , ;
vnoremap <Bslash> ,

"Close surrondings
inoremap <> <><Left>
inoremap (( ()<Left>
inoremap {{ {}<Left>
inoremap [[ []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

" Accents
inoremap <silent>,. <C-k>
inoremap <right>l <C-x><C-l>
inoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

"Sane line moves
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Visual mode
" change escape to jk
vnoremap jk <esc>

" Unmap Q
noremap Q <nop>

" Normal mode

" Buffer shortcuts
nnoremap <silent><leader>bn :bn<cr>
nnoremap <silent><leader>bp :bp<cr>
nnoremap <silent><leader>bd :bp\|bdelete! #<cr>

" File exploration
nnoremap <silent><leader>fe :Dirvish<CR>

" Registers 
nnoremap <silent><leader>re i<C-r>
nnoremap <silent><leader>rp i<C-r>0<esc>
nnoremap <silent><Leader>rc :let @a=@" \| let @"=@+ \| let @+=@a<CR>

" Window shortcuts
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <silent><leader>H <C-w>K
nnoremap <silent><leader>V <C-w>H
nnoremap <silent><leader>mf <C-f>
nnoremap <silent><leader>mb <C-b>
nnoremap <silent><leader>mu <C-u>
nnoremap <silent><leader>md <C-d>
nnoremap <silent><leader>zi <C-w>_
nnoremap <silent><leader>= <C-w>=
nnoremap <silent><leader><BS> <C-w><C-x>
nnoremap <silent><leader>> <C-w>r
nnoremap <silent><leader>< <C-w>R
nnoremap <silent><leader>O <C-w>o

nnoremap <silent><leader>pf <C-^>

" save files and quit
nnoremap <silent><leader>xd :w\|bdelete<cr>
nnoremap <silent><leader>q :q<cr>
nnoremap <silent><leader>Q :qa!<cr>

" Split window
nnoremap <silent><leader>vs :vsplit<cr>
nnoremap <silent><leader>sb :split<cr>

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

"Folding
nnoremap <silent> <Leader>z0 :set foldlevel=0<CR>
nnoremap <silent> <Leader>z1 :set foldlevel=1<CR>
nnoremap <silent> <Leader>z2 :set foldlevel=2<CR>
nnoremap <silent> <Leader>z3 :set foldlevel=3<CR>
nnoremap <silent> <Leader>z4 :set foldlevel=4<CR>
nnoremap <silent> <Leader>z5 :set foldlevel=5<CR>
nnoremap <silent> <Leader>z6 :set foldlevel=6<CR>
nnoremap <silent> <Leader>z7 :set foldlevel=7<CR>
nnoremap <silent> <Leader>z8 :set foldlevel=8<CR>
nnoremap <silent> <Leader>z9 :set foldlevel=9<CR>

"Goyo
nnoremap <silent> <leader><leader> :Goyo<cr>

"Do macro
nnoremap <silent> <leader>d @
