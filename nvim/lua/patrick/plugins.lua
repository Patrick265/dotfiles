-- Setup for plugins
require('lualine').setup()

require("nvim-tree").setup()
require("colorizer").setup()

local lsp_flags = {
	debounce_text_changes = 150,
}

require'lspconfig'.pyright.setup{
    flags = lsp_flags,
}

require'lspconfig'.clangd.setup{}

require('glow').setup(
{
	style = "dark",
	width = 300
})

require('hlargs').setup(
{
	color = '#f9e2af'

})

