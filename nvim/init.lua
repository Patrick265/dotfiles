vim.g.mapleader        = ' '

vim.opt.termguicolors  = true
vim.opt.shiftwidth     = 4
vim.opt.tabstop        = 4
vim.opt.expandtab      = true
vim.opt.colorcolumn    = '120'
vim.opt.background     = 'dark'
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.termguicolors  = true
vim.opt.updatetime     = 50
vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.cmdheight      = 1
vim.opt.updatetime     = 50
vim.opt.wrap           = false
vim.opt.signcolumn     = 'yes'

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')

vim.keymap.set({ 'n', 'v' }, '<leader>y', '+y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '+p')
vim.keymap.set({ 'n', 'v' }, '<leader>tt', ':tabnew<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>tv', ':vsplit<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>th', ':split<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>l', ':tabnext<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>h', ':tabprevious<CR>')

vim.keymap.set('n', '<leader>s', ':LspClangdSwitchSourceHeader<CR>')

-- Download/Install plugins
require('config.lazy')

-- Configure Plugins
require('picker')
require('filetree')
require('treesitter')
require('lsp')
require('cmp')

vim.cmd('colorscheme retrobox')
vim.cmd([[hi normal guibg=NONE ctermbg=NONE]])
