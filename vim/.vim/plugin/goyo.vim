" Goyo
function! s:goyo_enter()
	colorscheme deep-sea
	set cursorline
endfunction

function! s:goyo_leave()
	colorscheme deep-sea
	set nocursorline
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
