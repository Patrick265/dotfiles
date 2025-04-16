vim.cmd(":TSInstall all");

require'nvim-web-devicons'.setup {
    color_icons = true;
    default = true;
}

require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'tokyonight',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'tabs'},
        lualine_z = {'searchcount'}
    }
})
