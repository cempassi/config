" Startify config
let g:startify_session_dir = '~/.vim/session' 
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 0

autocmd User Startified setlocal buflisted

nmap <leader>sl :SLoad<cr>
nmap <leader>ss :SSave!<cr>
