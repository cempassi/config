" Goyo
nnoremap <silent> <leader>zz :Goyo<cr>

function! s:goyo_enter()
	hi VertSplit term=NONE cterm=NONE gui=NONE guifg=bg guibg=bg
	hi LineNr ctermfg=white
	hi CursorLineNr ctermfg=cyan
	highlight Pmenu ctermbg=16 ctermfg=111 
	highlight clear SignColumn
	highlight CocErrorFloat cterm=none ctermfg=8 ctermbg=none
endfunction

function! s:goyo_leave()
	hi VertSplit term=NONE cterm=NONE gui=NONE guifg=bg guibg=bg
	hi LineNr ctermfg=white
	hi CursorLineNr ctermfg=cyan
	highlight Pmenu ctermbg=16 ctermfg=111 
	highlight clear SignColumn
	highlight CocErrorFloat cterm=none ctermfg=8 ctermbg=none
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
