local Remap = require("patrick.keymap")

local nnoremap  = Remap.nnoremap
local inoremap  = Remap.inoremap


nnoremap("<Leader>tt", ":tabnew<CR>")
nnoremap("<Leader>tv", ":vsplit<CR>")
nnoremap("<Leader>th", ":split<CR>")
nnoremap("<Leader>l", ":tabnext<CR>")
nnoremap("<Leader>h", ":tabprevious<CR>")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("n", "nzz")
nnoremap("<Leader>s", ":ClangdSwitchSourceHeader<CR>")

nnoremap("<leader>y", "\"+y")
nnoremap("<leader>Y", "\"+Y")
nnoremap("<leader>d", "\"_d")

nnoremap("<Leader>ee", ":NvimTreeToggle<CR>")
nnoremap("<Leader>mdp", ":Glow<CR>")


require('gitsigns').setup(
{
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '<leader>gsd', gs.preview_hunk)
        map('n', '<leader>gbl', function() gs.blame_line{full=true} end)

    end
})


-- C/C++ Things
--
