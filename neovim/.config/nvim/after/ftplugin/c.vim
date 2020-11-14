" syntax hilighting
highlight Error ctermbg=196
highlight ALEError ctermbg=196
match Type /\<e_[a-z]\+\>\|\<t_[a-z]\+\>\|\<s_[a-z]\+\>\|\<u_[a-z]\+\>\|\<[a-z]*_t\>/

" Remove whitespaces on save
autocmd BufWrite *h,*.c :call TrailingWhitespaces()

function! Norme()
	call SpaceAfterIdentifier()
	let @/ = ""
	echom "Normed successfully"
endfunction

set foldenable
set foldnestmax=1
set foldmethod=syntax
set suffixesadd=.c,.h
set tabstop=4
set shiftwidth=4
