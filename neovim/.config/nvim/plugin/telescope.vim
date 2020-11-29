" Telescope
nnoremap <Leader>f<leader> <cmd>Telescope find_files find_command=rg,-i,--hidden,--files,-g,!.git<CR>
nnoremap <Leader>. <cmd>Telescope find_files find_command=rg,-i,--hidden,--files,-g,!.git cwd=~/.dotfiles<CR>
nnoremap <leader>b<leader> <cmd>Telescope buffers<cr>
nnoremap <leader>gs<leader> <cmd>Telescope git_status<CR>
nnoremap <leader>gb<leader> <cmd>Telescope git_branches<CR>
nnoremap <leader>gc<leader> <cmd>Telescope git_commits<CR>
nnoremap <leader>gcb<leader> <cmd>Telescopre git_bcommits<CR>
