local Remap = require("patrick.keymap")

local nnoremap = Remap.nnoremap

nnoremap("<Leader>f", function()
    require('telescope.builtin').find_files()
end)


nnoremap("<Leader>fg", function()
    require('telescope.builtin').git_files()
end)

nnoremap("<Leader>fs", function()
	require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)


nnoremap("<Leader>fw", function()
	require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword> ")})
end)

