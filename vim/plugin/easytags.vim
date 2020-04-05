" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    easytags.vim                                       :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: cempassi <cempassi@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2019/08/28 21:47:17 by cempassi          #+#    #+#              "
"    Updated: 2019/08/28 21:49:54 by cempassi         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

"easytags config
let g:easytags_events = ['BufWritePost']
set tags=./.tags;
let g:easytags_dynamic_files = 1
let g:easytags_always_enabled = 1
set cpoptions+="d"
