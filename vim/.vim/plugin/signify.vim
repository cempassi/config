let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '_'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

let g:signify_line_highlight = 0
let g:signify_disable_by_default = 1

nnoremap <silent> <leader>gt :SignifyToggle<cr>
nnoremap <silent> <leader>ghl :SignifyToggleHighlight<cr>
nnoremap <silent> <leader>ghd  :SignifyHunkDiff<cr>
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
