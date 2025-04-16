
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = true,
	autotag = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    }
}

require('winbar').setup({
    enabled = true,
    show_file_path = true,
    show_symbols = true,
    colors = {
        path = '', -- You can customize colors like #c946fd
        file_name = '',
        symbols = '',
    },
    icons = {
        file_icon_default = '',
        seperator = '>',
        editor_state = '●',
        lock_icon = '',
    },
    exclude_filetype = {
        'help',
        'startify',
        'dashboard',
        'packer',
        'neogitstatus',
        'NvimTree',
        'Trouble',
        'alpha',
        'lir',
        'Outline',
        'spectre_panel',
        'toggleterm',
        'qf',
    }
})
