" Coc Config
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

let g:coc_snippet_next = '<leader>sn'
let g:coc_snippet_prev = '<leader>sp'

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Highlight the symbol and its references when holding the cursor.
nmap <silent> <leader>* :call CocActionAsync('highlight')<cr>

"Completion menu hilighting
highlight Pmenu ctermbg=16 ctermfg=111 
highlight clear SignColumn
highlight CocHintSign guifg=#00AFF5

highlight CocErrorFloat cterm=none ctermfg=8 ctermbg=none

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

xmap <silent> <leader>ca :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>ca :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
