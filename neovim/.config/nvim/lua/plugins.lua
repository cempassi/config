vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}

	-- Status bar
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'

	-- Completion
	use {'neoclide/coc.nvim', branch = 'release'}

	-- Floating Lists
	use 'nvim-lua/popup.nvim'
  --use 'nvim-lua/telescope.nvim'

	-- File Navigation
	use {'ms-jpq/chadtree', branch = 'chad'}
	use 'justinmk/vim-dirvish.git'

	-- Git integration
	use 'tpope/vim-fugitive'
	use 'tpope/vim-git'
	use 'airblade/vim-gitgutter'
	use 'rhysd/git-messenger.vim'

	-- Floating terminal
	use 'voldikss/vim-floaterm'

	-- Async tasks
	use 'skywind3000/asynctasks.vim'
	use 'skywind3000/asyncrun.vim'

	-- Startup
  use 'glepnir/dashboard-nvim'
	use 'dstein64/vim-startuptime'

	-- Lua development
	use 'bfredl/nvim-luadev'
	use 'nvim-treesitter/playground'
  use {'glacambre/firenvim'}

	-- Misc
	use 'pbondoer/vim-42header'
	use 'liuchengxu/vim-which-key'
  use 'kyazdani42/nvim-web-devicons'
	use 'wincent/corpus'
	use 'junegunn/goyo.vim'
	use 'wellle/targets.vim'
	use 'norcalli/nvim-colorizer.lua'
	use 'honza/vim-snippets'
  use 'hashivim/vim-terraform'

  --local development, only use at home
  use '~/Programming/nvim/nvim-dap'
  use '~/Programming/nvim/nvim-dap-virtual-text'
  use '~/Programming/nvim/plenary.nvim'
  use '~/Programming/nvim/telescope.nvim'
  use '~/Programming/nvim/telescope-packer.nvim'
  use '~/Programming/nvim/telescope-github.nvim'
	end)
