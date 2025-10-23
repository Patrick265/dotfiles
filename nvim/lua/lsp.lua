require('mason').setup({})


local group = vim.api.nvim_create_augroup("LspMappings", { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
	group = group,
    callback = function(args)
        local opts = { buffer = args.buf, silent = true }

        vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', {buf = bufnr})
        vim.api.nvim_set_option_value('tagfunc', 'v:lua.vim.lsp.tagfunc', {buf = bufnr})
        vim.keymap.set('n', 'K',           vim.lsp.buf.hover,           opts)
        vim.keymap.set('n', '<leader>gd',  vim.lsp.buf.definition,      opts)
        vim.keymap.set('n', "<leader>vd",  vim.diagnostic.open_float,   opts)
        vim.keymap.set('n', '<F2>',        vim.lsp.buf.rename,          opts)
        vim.keymap.set('n', '<F3>',        vim.lsp.buf.format,          opts)
        vim.keymap.set('n', '<leader>gcD', vim.lsp.buf.declaration,     opts)
        vim.keymap.set('n', '<leader>gi',  vim.lsp.buf.implementation,  opts)
        vim.keymap.set('n', '<leader>go',  vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references,      opts)
        vim.keymap.set('n', '<leader>gs',  vim.lsp.buf.signature_help,  opts)
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action,     opts)
    end,
})


vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN]  = '▲',
            [vim.diagnostic.severity.HINT]  = '⚑',
            [vim.diagnostic.severity.INFO]  = '»',
        },
    },
})

local lsp_servers = {
    'lua_ls', 
    'pyright', 
    'clangd', 
    'vhdl_ls', 
    'cmake',
    'rust_analyzer',
    'bashls'
}

for _, server_name in pairs(lsp_servers) do
    vim.lsp.enable(server_name)
end
