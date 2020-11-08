
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
	let file = expand("<cWORD>")
	if file =~ '\h.*'
		let file = "./" . file
	endif
	execute "Git add " . file
	execute "%d"
	silent read !git status
	g/(.*/d
	execute "noh"
	normal! M
endfunction

function! gitstatus#GitUnstage()
	let file = expand("<cWORD>")
	if file =~ '\h*'
		let file = "./" . file
	endif
	execute "silent Git restore --staged " . file
	execute "%d"
	silent read !git status
	g/(.*/d
	execute "noh"
	normal! M
endfunction

nnoremap <leader>gs :call gitstatus#GitStatus()<cr>
