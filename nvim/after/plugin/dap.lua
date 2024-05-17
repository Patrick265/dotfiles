local dap = require('dap')

local Remap = require("patrick.keymap")

local nnoremap  = Remap.nnoremap
local inoremap  = Remap.inoremap

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/patrick/.vscode/extensions/ms-vscode.cpptools-1.15.4-linux-x64/debugAdapters/bin/OpenDebugAD7',
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
