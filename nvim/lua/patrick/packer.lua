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
		requires = { 'kyazdani42/nvim-web-devicons' }
	}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
    use { 'fgheng/winbar.nvim' }


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
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'onsails/lspkind.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'SmiteshP/nvim-navic'
	-- Themes
	use 'folke/tokyonight.nvim'
	use 'vv9k/bogster'
	use 'EdenEast/nightfox.nvim'
    use 'Yagua/nebulous.nvim'
    use 'bluz71/vim-moonfly-colors'
    use 'sainnhe/sonokai'
    use 'nvim-tree/nvim-web-devicons'
	-- Utility
	use 'norcalli/nvim-colorizer.lua'
    use 'lewis6991/gitsigns.nvim'
end)

