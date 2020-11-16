vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}

	use {'neoclide/coc.nvim', branch = 'release'}
	use {'liuchengxu/vim-clap', run = 'make'}
	use {'ms-jpq/chadtree', branch = 'chad'}
	use 'vn-ki/coc-clap'
	use 'pbondoer/vim-42header'
	use 'vim-airline/vim-airline'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-git'
	use 'liuchengxu/vim-which-key'
	use 'mhinz/vim-startify'
	use 'vimwiki/vimwiki'
	use 'junegunn/goyo.vim'
	use 'wellle/targets.vim'
	--use 'justinmk/vim-dirvish.git'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/telescope.nvim'
	use 'vim-airline/vim-airline-themes'
	use 'norcalli/nvim-colorizer.lua'
	use 'voldikss/vim-floaterm'
	use 'skywind3000/asynctasks.vim'
	use 'skywind3000/asyncrun.vim'
	use 'honza/vim-snippets'
	use 'airblade/vim-gitgutter'

	--use 'cempassi/neogit'
	end)
