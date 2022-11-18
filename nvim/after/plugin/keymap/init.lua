local Remap = require("patrick.keymap")

local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

nnoremap("<Leader>tt", ":tabnew<CR>")
nnoremap("<Leader>tv", ":vsplit<CR>")
nnoremap("<Leader>th", ":split<CR>")
nnoremap("<Leader>l", ":tabnext<CR>")
nnoremap("<Leader>h", ":tabprevious<CR>")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("n", "nzz")

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

nnoremap("<Leader>ff", function()
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


nnoremap("<Leader>ee", ":NvimTreeToggle<CR>")
nnoremap("<Leader>mdp", ":Glow<CR>")

