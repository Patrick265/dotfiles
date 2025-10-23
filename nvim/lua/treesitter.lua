-- Syntax highlighting
--
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = true,
    ignore_install = { "ipkg" }, -- Crashes
    autotag = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
