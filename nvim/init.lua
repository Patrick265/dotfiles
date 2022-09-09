-- REQUIRES LUA SUPPORT IN NEOVIM 
require('patrick')


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

g.mapleader = " "
-- colorschemes
cmd [[colorscheme carbonfox]]


