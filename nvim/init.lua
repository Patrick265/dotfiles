-- REQUIRES LUA SUPPORT IN NEOVIM 

require('plugins/plugins')


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

-- colorschemes
cmd [[colorscheme gruvbox-material]]


