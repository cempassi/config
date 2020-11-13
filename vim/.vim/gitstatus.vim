" augroup gitstatus
"     autocmd!
" 	autocmd BufEnter gitstatus silent call gitstatus#Update()
" augroup END
" nnoremap <Plug>Gitstatus 		:call gitstatus#Status()<cr>
" nnoremap <Plug>GitstatusStage 	:call gitstatus#Stage()<cr>
" nnoremap <Plug>GitstatusUnstage :call gitstatus#Unstage()<cr>
" nnoremap <Plug>GitstatusRemove 	:call gitstatus#Remove()<cr>
" nnoremap <Plug>GitstatusUpdate 	:call gitstatus#Update()<cr>
" 
" function! gitstatus#Update()
" 	execute "%d"
" 	silent read !git status
" 	g/(.*/d
" 	execute "noh"
" 	normal! M
" endfunction
" 
" 	normal! M
" endfunction
" 
" function! gitstatus#Remove()
" 	let file = expand("<cWORD>")
" 	if file =~ '\h.*'
" 		let file = "./" . file
" 	endif
" 	execute "Git rm -f " . file
" 	execute "%d"
" 	silent read !git status
" 	g/(.*/d
" 	execute "noh"
" 	normal! M
" endfunction
" 
" function! gitstatus#Unstage()
" 	let file = expand("<cWORD>")
" 	if file =~ '\h*'
" 		let file = "./" . file
" 	endif
" 	execute "silent Git restore --staged " . file
" 	execute "%d"
" 	silent read !git status
" 	g/(.*/d
" 	execute "noh"
" 	normal! M
" endfunction
" 
" nnoremap <leader>gg :call gitstatus#Status()<cr>
