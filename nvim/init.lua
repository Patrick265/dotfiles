-- REQUIRES LUA SUPPORT IN NEOVIM 
		

-- variables for ease of use
local g = vim.g
local cmd = vim.cmd
local options = vim.opt

-- Settings
options.shiftwidth = 4
options.tabstop=4
options.termguicolors= true
options.background = 'dark'
options.number = true
options.relativenumber = true
options.termguicolors = true
g.mapleader = " "
options.colorcolumn = "80"
options.updatetime = 50


-- Some plugins require stuff to be set before
require('patrick')
-- colorschemes
cmd [[colorscheme carbonfox]]

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

