-- REQUIRES LUA SUPPORT IN NEOVIM 
		
-- variables for ease of use
local g = vim.g
local cmd = vim.cmd
local options = vim.opt

-- Settings
options.termguicolors= true
options.shiftwidth = 4
options.tabstop=4
options.expandtab = true
options.background = 'dark'
options.number = true
options.relativenumber = true
options.termguicolors = true
g.mapleader = " "
options.colorcolumn = "80"
options.updatetime = 50
options.swapfile = false
options.backup = false
options.cmdheight = 1
options.updatetime = 50
options.wrap = false


local autocmd = vim.api.nvim_create_autocmd


require('patrick')

-- Some plugins require stuff to be set before
-- colorschemes
-- cmd("colorscheme tokyonight-night")
require("nebulous").setup { variant="twilight"}

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[hi normal guibg=NONE ctermbg=NONE]])
