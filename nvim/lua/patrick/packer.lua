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

    use 'nvim-tree/nvim-web-devicons'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
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
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use "lewis6991/gitsigns.nvim"

    -- Debugging
    use 'mfussenegger/nvim-dap'

    -- TASKS
    use {'stevearc/dressing.nvim'}
    use {
        'stevearc/overseer.nvim',
        config = function() require('overseer').setup() end
    }

    use 'Civitasv/cmake-tools.nvim'

    -- Remote development files
    use {
        'amitds1997/remote-nvim.nvim',
        requires = {
            { "nvim-lua/plenary.nvim" }, -- For standard functions
            { "MunifTanjim/nui.nvim"  }, -- To build the plugin UI
            { "nvim-telescope/telescope.nvim" }, -- For picking b/w different remote methods
        }
    }

    -- Themes
    use "blazkowolf/gruber-darker.nvim"
    use "miikanissi/modus-themes.nvim"
    use "projekt0n/github-nvim-theme"
    use "aktersnurra/no-clown-fiesta.nvim"
end)

