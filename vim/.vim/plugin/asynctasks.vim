function! s:runner_proc(opts)
  let curr_bufnr = floaterm#curr()
  if has_key(a:opts, 'silent') && a:opts.silent == 1
    FloatermHide!
  endif
  let cmd = 'cd ' . shellescape(getcwd())
  call floaterm#terminal#send(curr_bufnr, [cmd])
  call floaterm#terminal#send(curr_bufnr, [a:opts.cmd])
  stopinsert
  if &filetype == 'floaterm' && g:floaterm_autoinsert
    call floaterm#util#startinsert()
  endif
endfunction

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.floaterm = function('s:runner_proc')
let g:asynctasks_term_pos="floaterm"

"Make shortcuts
nnoremap <silent><leader>mk :AsyncTask build<cr>
nnoremap <silent><leader>mc :AsyncTask clean<cr>
nnoremap <silent><leader>mr :AsyncTask run<cr>
nnoremap <silent><leader>me :AsyncTaskEdit<cr><cr>
nnoremap <silent><leader>mn :cn<CR>
nnoremap <silent><leader>mp :cp<CR>
nnoremap <silent><leader>mw :cw<CR>
