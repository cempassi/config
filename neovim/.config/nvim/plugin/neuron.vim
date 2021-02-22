" find your notes, click enter to create the note if there are not notes that match
nnoremap <leader>n<leader> <cmd>lua require'neuron/telescope'.find_zettels()<CR>

" create a new note
nnoremap <leader>ne <cmd>lua require'neuron/cmd'.new_edit("~/notes")<CR>
