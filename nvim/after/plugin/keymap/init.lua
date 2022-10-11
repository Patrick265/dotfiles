local Remap = require("patrick.keymap")

local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

nnoremap("<Leader>tt", ":tabnew<CR>")
nnoremap("<Leader>tv", ":vsplit<CR>")
nnoremap("<Leader>th", ":split<CR>")
nnoremap("<Leader>l", ":tabnext<CR>")
nnoremap("<Leader>h", ":tabprevious<CR>")

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


-- TAB To Auto complete
local cmp = require('cmp')
local luasnip = require("luasnip")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


cmp.setup {
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}
}
