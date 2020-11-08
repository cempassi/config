" Clap mappings
let g:clap_layout = { 'relative': 'editor' }
let g:clap_provider_grep_opts =  '-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'

"Clap floaterm

nnoremap <silent> <leader>tl :Clap floaterm<cr>

"Clap for coc
nnoremap <silent> <leader>bb :Clap buffers<cr> 
nnoremap <silent> <leader>cl :Clap coc_commands<cr> 
nnoremap <silent> <leader>ce :Clap coc_extensions<cr>
nnoremap <silent> <leader>cs :Clap coc_symbols<cr>

nnoremap <silent> <leader>rl :Clap registers<cr>
nnoremap <silent><leader>yl :Clap yanks<cr>
nnoremap <silent><leader>ml :Clap maps<cr>

" Errors mappings
nnoremap <silent> <leader>el :Clap coc_diagnostics<cr>

" Find mapping
nnoremap <silent> <leader>ff :Clap files<cr>
nnoremap <silent> <leader>fb :Clap blines<cr>
nnoremap <silent> <leader>fl :Clap lines<cr>
nnoremap <silent> <leader>fj :Clap jumps<cr>
