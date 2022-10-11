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
		'm-demare/hlargs.nvim',
		requires = { 'nvim-treesitter/nvim-treesitter' }
	}

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Intellisense
		use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    	use("hrsh7th/cmp-nvim-lsp")
	    use("hrsh7th/cmp-buffer")
	    use("hrsh7th/nvim-cmp")
		use("onsails/lspkind-nvim")
		use("glepnir/lspsaga.nvim")
		use("simrat39/symbols-outline.nvim")
		use("L3MON4D3/LuaSnip")
		-- use("saadparwaiz1/cmp_luasnip")
	-- THEMES
	use 'folke/tokyonight.nvim'
	use 'EdenEast/nightfox.nvim'
	use 'B4mbus/oxocarbon-lua.nvim'
	use 'catppuccin/vim'

	-- Utility
	use 'norcalli/nvim-colorizer.lua'

	use 'f-person/git-blame.nvim'
end)

