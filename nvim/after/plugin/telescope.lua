local telescope = require("telescope")

local Remap = require("patrick.keymap")

local nnoremap  = Remap.nnoremap
local inoremap  = Remap.inoremap

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
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = { ".git/", ".cache", "%.o", "%.a", "%.out", ".clangd/", 
                                "acp2/", "angii_sw/", "sony-nmos-daemon/", "device-tree/", 
                                "logging/", "libswp08/", "smarc/" },
                                
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
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

local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  if vim.v.shell_error == 0 then
  else
    require"telescope.builtin".find_files(opts)
  end
end

nnoremap("<Leader>ff", function()
    require"telescope.builtin".find_files(opts)
end)

nnoremap("<Leader>fg", function()
    require"telescope.builtin".git_files(opts)
end)

nnoremap("<Leader>fe", function()
    require"telescope.builtin".diagnostics()
end)

nnoremap("<Leader>fb", function()
    require"telescope.builtin".lsp_document_symbols()
end)

nnoremap("<Leader>fr", function()
    require"telescope.builtin".lsp_references()
end)

nnoremap("<Leader>fs", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

nnoremap("<Leader>fw", function()
    require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword> ")})
end)
