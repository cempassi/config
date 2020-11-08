
function! gitstatus#GitStatus()
	if bufloaded("gitstatus") 
		echo "Already there"
	else
		execute "bo split gitstatus| silent read !git status \| grep -v '('"
		execute "setlocal filetype=gitstatus"
		execute "normal! zR"
		execute "nmap <buffer> <leader>ga :call gitstatus#GitAdd()<cr>"
		execute "nmap <buffer> <leader>gu :call gitstatus#GitUnstage()<cr>"
		execute "setlocal buftype=nofile"
		execute "setlocal bufhidden=wipe"
		execute "setlocal nobuflisted"
	endif
endfunction

function! gitstatus#GitAdd()
	let file = expand("<cfile>")
	if (filereadable(file))
		execute "Git add " . file
		execute "%d"
		execute "silent read !git status"
		execute "g/(.*/d|noh | normal! gg"
	else
		echo "No file"
	endif
endfunction

function! gitstatus#GitUnstage()
	let file = expand("<cfile>")
	if (filereadable(file))
		execute "%d"
		execute "silent Git restore --staged " . file
		execute "silent read !git status"
		execute "g/(.*/d|noh | normal! gg"
	else
		echo "No file"
	endif
endfunction

nnoremap <leader>gs :call gitstatus#GitStatus()<cr>
