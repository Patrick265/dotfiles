vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
	-- PACKER
	use 'wbthomason/packer.nvim'

	-- Statusbar
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
		    'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	-- Markdown
	use {"ellisonleao/glow.nvim"}


	-- Telescope dependecies
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	}

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Intellisense
	use 'neovim/nvim-lspconfig'

	-- Themes
	use 'folke/tokyonight.nvim'
	use 'B4mbus/oxocarbon-lua.nvim'
	use 'catppuccin/vim'
	use 'vv9k/bogster'
	use 'yonlu/omni.vim'

	-- Utility
	use 'norcalli/nvim-colorizer.lua'


end)

