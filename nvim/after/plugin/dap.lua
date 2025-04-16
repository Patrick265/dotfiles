local dap = require('dap')

local Remap = require("patrick.keymap")

local nnoremap  = Remap.nnoremap
local inoremap  = Remap.inoremap

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

dap.configurations.cpp = {
    {
    },
}

nnoremap("<Leader>b", function()
    require('dap').toggle_breakpoint()
end)

nnoremap("<F5>", function()
    require('dap').continue()
end)

nnoremap("<F10>", function()
    require('dap').step_into()
end)

nnoremap("<F11>", function()
    require('dap').step_over()
end)
