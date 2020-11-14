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
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
nmap <silent> <leader>ep <Plug>(coc-diagnostic-prev)

" Symbol renaming.
nmap <silent> <leader>cn <Plug>(coc-rename)

" Apply AutoFix to problem on the current line.
nmap <silent> <leader>ef  <Plug>(coc-fix-current)

let g:coc_snippet_next = '<leader>sn'
let g:coc_snippet_prev = '<leader>sp'

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <silent> <leader>cf <Plug>(coc-format)

" Highlight the symbol and its references when holding the cursor.
nmap <silent> <leader>* :call CocActionAsync('highlight')<cr>

"Completion menu hilighting
highlight Pmenu ctermbg=16 ctermfg=111 
highlight clear SignColumn
highlight CocHintSign guifg=#00AFF5

highlight CocErrorFloat cterm=none ctermfg=8 ctermbg=none

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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

" Rust InlayHints togle
nmap <silent> <leader>ch :CocCommand rust-analyzer.toggleInlayHints<cr>
