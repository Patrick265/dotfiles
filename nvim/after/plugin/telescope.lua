local telescope = require("telescope")

local Remap = require("patrick.keymap")

local nnoremap  = Remap.nnoremap
local inoremap  = Remap.inoremap

local theme_selection = "dropdown"

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
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.8,
                results_width = 0.3,
            },
            vertical = {
                mirror = false,
            },
            width = 0.80,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = { ".git/", ".cache", "%.o", "%.a", "%.out", ".clangd/", 
                                "acp2/", "angii_sw/", "sony-nmos-daemon/", "device-tree/", 
                                "logging/", "uio/", "libswp08/", "smarc/" },
                                
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
    require"telescope.builtin".git_files(opts)
  else
    require"telescope.builtin".find_files(opts)
  end
end

nnoremap("<Leader>ff", function()
    local opts  = {}
    local ok    = pcall(require('telescope.builtin').git_files, opts)
    if not ok then 
        require("telescope.builtin").find_files(opts)
    end
end)

nnoremap("<Leader>fs", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

nnoremap("<Leader>fw", function()
    require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword> ")})
end)
