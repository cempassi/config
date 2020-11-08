augroup gitstatus
    autocmd!
	autocmd BufEnter gitstatus silent call gitstatus#GitStatusUpdate()
augroup END

function! gitstatus#GitStatus()
	if bufloaded("gitstatus") 
		silent call gitstatus#GitStatusUpdate()
	else
		execute "bo split gitstatus"
		setlocal filetype=gitstatus
		setlocal buftype=nofile
		setlocal bufhidden=wipe
		setlocal nobuflisted
		nmap <buffer> <leader>ga :call gitstatus#GitAdd()<cr>
		nmap <buffer> <leader>gu :call gitstatus#GitUnstage()<cr>
		nmap <buffer> <leader>gr :call gitstatus#GitRemove()<cr>
		normal! zR
	endif
endfunction

function! gitstatus#GitStatusUpdate()
	execute "%d"
	silent read !git status
	g/(.*/d
	execute "noh"
	normal! M
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

function! gitstatus#GitRemove()
	let file = expand("<cWORD>")
	if file =~ '\h.*'
		let file = "./" . file
	endif
	execute "Git rm -f " . file
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
