
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
    },
}
