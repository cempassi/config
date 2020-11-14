" Floaterm config

let g:floaterm_rootmarkers = ['.project', '.git', '.hg', '.svn', '.root', '.gitignore'] 

let g:floaterm_autoclose = 0

let g:floaterm_gitcommit = 'vsplit'

let g:floaterm_open_command = 'drop'

"Mappings
nnoremap   <silent>   <leader>tc    :FloatermNew<CR>
tnoremap   <silent>   <leader>tc    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <leader>tp    :FloatermPrev<CR>
tnoremap   <silent>   <leader>tp    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <leader>tn    :FloatermNext<CR>
tnoremap   <silent>   <leader>tn    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <leader><leader>   :FloatermToggle<CR>
tnoremap   <silent>   <leader><leader>   <C-\><C-n>:FloatermToggle<CR>
