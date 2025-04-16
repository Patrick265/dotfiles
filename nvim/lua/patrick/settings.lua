local g       = vim.g
local cmd     = vim.cmd
local options = vim.opt
local autocmd = vim.api.nvim_create_autocmd

g.loaded             = 1
g.loaded_netrwPlugin = 1
g.mapleader          = " "

options.termguicolors  = true
options.shiftwidth     = 4
options.tabstop        = 4
options.expandtab      = true
options.background     = 'dark'
options.number         = true
options.relativenumber = true
options.termguicolors  = true
options.updatetime     = 50
options.swapfile       = false
options.backup         = false
options.cmdheight      = 1
options.updatetime     = 50
options.wrap           = false
options.signcolumn     = 'yes'

-- Some plugins require stuff to be set before
-- colorschemes
cmd("colorscheme no-clown-fiesta")
cmd([[hi normal guibg=NONE ctermbg=NONE]])

