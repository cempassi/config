" Vim which Key

let g:which_key_vertical = 0
let g:which_key_map = {}

let g:which_key_map.b = {
			\ 'name': '+Buffers',
			\ 'b': ['<leader>bb', 'List all Buffers'],
			\ 'n': ['<leader>bn', 'Go to Next Buffer'],
			\ 'p': ['<leader>bp', 'Go to Previous Buffer'],
			\ 'd': ['<leader>bd', 'Delete buffer'],
			\}


let g:which_key_map.c = {
			\ 'name': '+Coc/Clap',
			\ 'c': ['<leader>cc', 'List Coc Commands'],
			\ 'd': ['<leader>cd', 'Go to Definition'],
			\ 'h': ['<leader>ch', 'Hover'],
			\ 't': ['<leader>ct', 'Go to Type definition'],
			\ 'i': ['<leader>ci', 'Go to Implementation'],
			\ 'r': ['<leader>cr', 'List References'],
			\ 'e': ['<leader>ce', 'List Coc Extensions'],
			\ 's': ['<leader>cs', 'List Coc Symbols'],
			\}

let g:which_key_map.f = {
			\ 'name': '+Find',
			\ 'e': ['<leader>fe', 'Explore from project root'],
			\ 'E': ['<leader>fE', 'Explore from current'],
			\ 'f': ['<leader>ff', 'Find file'],
			\ 'b': ['<leader>cd', 'Find in Buffer'],
			\ 'l': ['<leader>ch', 'Find in all lines'],
			\ 'j': ['<leader>ct', 'Find in all Jumps'],
			\}

let g:which_key_map.e = {
			\ 'name': '+Errors',
			\ 'l': ['<leader>el', 'List Errors and Warnings'],
			\ 'n': ['<leader>en', 'Go to Next Error'],
			\ 'p': ['<leader>np', 'Go to Previous Error'],
			\}

let g:which_key_map.x = {
			\ 'name': '+Save',
			\ 'x': ['<leader>xx', 'Save current'],
			\ 'd': ['<leader>xd', 'Save and Delete'],
			\ 'a': ['<leader>xa', 'Save all and Quit'],
			\}

call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
