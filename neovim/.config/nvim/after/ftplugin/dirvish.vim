nnoremap <buffer>e :e %
nnoremap <buffer>d :!mkdir %
nnoremap <buffer>rm :!rm -rf <c-r><c-A>

command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
