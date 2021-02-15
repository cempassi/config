" click enter on [[my_link]] or [[[my_link]]] to enter it
nnoremap <buffer> <CR> <cmd>lua require'neuron'.enter_link()<CR>


" insert the id of the note that is found
nnoremap <buffer> <leader>N<leader> <cmd>lua require'neuron/telescope'.find_zettels {insert = true}<CR>

" find the backlinks of the current note all the note that link this note
nnoremap <buffer> <leader>nf <cmd>lua require'neuron/telescope'.find_backlinks()<CR>

" same as above but insert the found id
nnoremap <buffer> <leader>Nf <cmd>lua require'neuron/telescope'.find_backlinks {insert = true}<CR>

" find all tags and insert
nnoremap <buffer> <leader>nt <cmd>lua require'neuron/telescope'.find_tags()<CR>

" go to next [[my_link]] or [[[my_link]]]
nnoremap <buffer> <leader>nn <cmd>lua require'neuron'.goto_next_extmark()<CR>

" go to previous
nnoremap <buffer> <leader>np <cmd>lua require'neuron'.goto_prev_extmark()<CR>]]d
