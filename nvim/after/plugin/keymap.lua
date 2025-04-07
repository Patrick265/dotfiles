local Remap = require("patrick.keymap")

local nnoremap  = Remap.nnoremap
local inoremap  = Remap.inoremap


nnoremap("<Leader>tt", ":tabnew<CR>")
nnoremap("<Leader>tv", ":vsplit<CR>")
nnoremap("<Leader>th", ":split<CR>")
nnoremap("<Leader>l",  ":tabnext<CR>")
nnoremap("<Leader>h",  ":tabprevious<CR>")
nnoremap("<C-u>",      "<C-u>zz")
nnoremap("<C-d>",      "<C-d>zz")
nnoremap("n",          "nzz")
nnoremap("<Leader>s",  ":ClangdSwitchSourceHeader<CR>")
nnoremap("<Leader>ee", ":NvimTreeToggle<CR>")
nnoremap("<leader>y",  "\"+y")
nnoremap("<leader>Y",  "\"+Y")
nnoremap("<leader>d",  "\"_d")

nnoremap("<F6>",       ":CMakeGenerate<CR>")
nnoremap("<F7>",       ":CMakeBuild -j 20<CR>")

