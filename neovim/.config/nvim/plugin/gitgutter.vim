let g:gitgutter_enabled = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 1

let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '~'
let g:gitgutter_sign_removed            = '-'
let g:gitgutter_sign_removed_first_line = '‾'
let g:gitgutter_sign_removed_above_and_below = '_¯'
let g:gitgutter_sign_modified_removed   = '~_'
let g:gitgutter_sign_priority = 5

highlight link GitGutterAdd    DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete
