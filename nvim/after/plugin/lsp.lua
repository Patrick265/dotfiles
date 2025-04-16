local Remap = require("patrick.keymap")

local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}


local cmp = require("cmp")
local luasnip = require("luasnip")
local navic = require("nvim-navic")
local tabnine = require("cmp_tabnine.config")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {  
        fields = { "kind", "abbr", "menu" },
	    format = function(entry, vim_item)
	    	vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
        		nvim_lsp = "[LSP]",
        		nvim_lua = "[Lua]",
        		luasnip = "[LuaSnip]",
				buffer = "[Buffer]",
			})[entry.source.name]
			return vim_item
		end
	},
	mapping = {
		['<C>b>'] = cmp.mapping.scroll_docs(-4),
		['<C>f>'] = cmp.mapping.scroll_docs(4),
		['<C>Space>'] = cmp.mapping.complete(),
		['<C>e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
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
		end, { "i", "s"}),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s"}),
	},
	sources ={ 
		{ name = "nvim_lsp" },
		{ name = "cmp_tabnine" },
		{ name = "luasnip" },
	},
})

tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
})

navic.setup({
    icons = kind_icons,
    highlight = false,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true
})

local on_attach = function(client, bufnr)
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	nnoremap("<leader>gd", function() vim.lsp.buf.definition() end)
	nnoremap("K", function() vim.lsp.buf.hover() end)
	nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
	nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
	nnoremap("[d", function() vim.diagnostic.goto_next() end)
	nnoremap("]d", function() vim.diagnostic.goto_prev() end)
	nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
	nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
		filter = function(code_action)
			if not code_action or not code_action.data then
				return false
			end
			local data = code_action.data.id
			return string.sub(data, #data - 1, #data) == ":0"
		end,
		apply = true
	}) end)
	nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
	nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
	inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").clangd.setup(
{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--background-index",
		"--suggest-missing-includes"
	}
})
require("lspconfig").pyright.setup(
{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
})

require("lspconfig").cmake.setup(
{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
})

require("lspconfig").rust_analyzer.setup(
{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
})

-- local snippets_paths = function()
--	local plugins = { "friendly-snippets" }
--	local paths = {}
--	local path
--	local root_path = vim.env.HOME .. "/.vim/plugged/"
--	for _, plug in ipairs(plugins) do
--		path = root_path .. plug
--		if vim.fn.isdirectory(path) ~= 0 then
--			table.insert(paths, path)
--		end
--	end
--	return paths
--end
--
--require("luasnip.loaders.from_vscode").lazy_load({
--	paths = snippets_paths(),
--	include = nil, -- Load all languages
--	exclude = {},
--})
--
