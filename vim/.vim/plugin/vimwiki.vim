" VimWiki

let g:vimwiki_global_ext = 0
let g:vimwiki_table_mappings = 0 "tab completion
let g:vimwiki_dir_link = 'index'
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown'}
let g:vimwiki_root = '~/Wiki'
let g:vimwiki_list = [
			\{'path': '~/Wiki', 'syntax': 'markdown', 'diary_rel_path': 'Diary',
				\'diary_index': 'index', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Tools',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Languages',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Languages/Bash',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Languages/C',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Languages/C++',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Languages/Python',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'},
			\{'path': '~/Wiki/Software/Languages/Rust',
				\ 'syntax': 'markdown', 'links_space_char': '_', 'ext': '.md'}]
