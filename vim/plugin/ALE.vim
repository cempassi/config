"ALE config
if filereadable(".lvimrc")
	source .lvimrc
endif
let g:ale_c_parse_makefile=0
let g:ale_linters_explicit=1
let g:ale_linters={'c': ['clang'], 'python': ['flake8', 'pyre'], 'elm': ['elm_ls'] }
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_c_clang_options="-Wall -Werror -Wextra -I libft/includes/ -I includes/"

let airline#extensions#ale#warning_symbol = '☞  '
let airline#extensions#ale#error_symbol = '✘:'
let airline#extensions#ale#open_lnum_symbol = '[l'
let airline#extensions#ale#close_lnum_symbol = ']'
