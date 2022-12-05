
require('gitsigns').setup(
{
    signs = {
    },
    signcolumn = true,
    numhl      = false,
    linehl     = false,
    word_diff  = false,
    attach_to_untracked = true,
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
})


