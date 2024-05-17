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

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'tzachar/cmp-tabnine'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    -- Themes
    use 'vv9k/bogster'
    use 'EdenEast/nightfox.nvim'
    use 'Yagua/nebulous.nvim'
    use 'bluz71/vim-moonfly-colors'
    use 'sainnhe/sonokai'
    use({ 'kepano/flexoki-neovim', as = 'flexoki' })
    use { "catppuccin/nvim", as = "catppuccin" }
    -- Utility
    use 'norcalli/nvim-colorizer.lua'
    use 'lewis6991/gitsigns.nvim'

    use 'nvim-tree/nvim-web-devicons'
    -- Debugging
    use 'mfussenegger/nvim-dap'

    -- Tasks
    use {
      'stevearc/overseer.nvim',
      config = function() require('overseer').setup() end
    }

end)

