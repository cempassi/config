" syntax hilighting
highlight Error ctermbg=196
highlight ALEError ctermbg=196
match Type /\<e_[a-z]\+\>\|\<t_[a-z]\+\>\|\<s_[a-z]\+\>\|\<u_[a-z]\+\>\|\<[a-z]*_t\>/

" Remove whitespaces on save
autocmd BufWrite *h,*.c :call TrailingWhitespaces()

function! SpaceAfterIdentifier()
	12,$s/if (/if (/ge
	12,$s/while (/while (/ge
	12,$s/return (/return (/ge
	12,$s/break;/break ;/ge
	12,$s/return;/return ;/ge
	12,$s/\(\s*,\)\(\S\)/, \2/ge
endfunction

function! Norme()
	call SpaceAfterIdentifier()
	let @/ = ""
	echom "Normed successfully"
endfunction

" Automatic norme
nnoremap <silent><leader>nm :call Norme()<cr>:w<cr>
