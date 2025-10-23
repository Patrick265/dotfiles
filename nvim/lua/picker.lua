local telescope = require("telescope")

local options = {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.6,
                results_width = 0.4,
            },
            vertical = {
                mirror = false,
            },
            width = 0.90,
            height = 0.90,
            preview_cutoff = 80,
        },
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        color_devicons = true,
        use_less = true,
        path_display = { "truncate" },
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    },
}

telescope.setup(options);

vim.keymap.set({ 'n' }, '<leader>fg', ':Telescope find_files<CR>')
vim.keymap.set({ 'n' }, '<leader>fs', ':Telescope grep_string<CR>')
vim.keymap.set({ 'n' }, '<leader>ff', ':Telescope git_files<CR>')
vim.keymap.set({ 'n' }, '<leader>fe', ':Telescope diagnostics<CR>')
vim.keymap.set({ 'n' }, '<leader>fr', ':Telescope lsp_references<CR>')
vim.keymap.set({ 'n' }, '<leader>fds', ':Telescope lsp_document_symbols<CR>')
vim.keymap.set({ 'n' }, '<leader>fws', ':Telescope lsp_workspace_symbols<CR>')

