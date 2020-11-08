"autocmd BufLeave gitstatus bdelete

function! GitStatus()
	execute "bo split gitstatus| silent read !git status"
	execute "setlocal filetype=gitstatus"
	execute "setlocal buftype=nofile"
	execute "setlocal bufhidden=delete"
	execute "setlocal nobuflisted"
endfunction

nnoremap <leader>gs :call GitStatus()<cr>
