
local ls = require("luasnip")
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node


local print = function() return "std::cout << << std::endl;" end
local evs_log_info = function() return "EVS_LOG_INFO(\"\");"end
local evs_log_debg = function() return "EVS_LOG_DEBUG(\"\");"end
local evs_log_warn = function() return "EVS_LOG_WARNING(\"\");"end
local evs_log_erro = function() return "EVS_LOG_ERR(\"\");"end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "print",
            namr = "CPPPrint",
            dscr = "C++ print to stdout",
        }, {
            func(print, {}),
        }),
    },
})

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "evi",
            namr = "EVS_LOG_INFO",
            dscr = "EVS_LOG_INFO",
        }, {
            func(evs_log_info, {}),
        }),
    },
})

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "evd",
            namr = "EVS_LOG_DEBUG",
            dscr = "EVS_LOG_DEBUG",
        }, {
            func(evs_log_debg, {}),
        }),
    },
})

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "evw",
            namr = "EVS_LOG_WARNING",
            dscr = "EVS_LOG_WARNING",
        }, {
            func(evs_log_warn, {}),
        }),
    },
})

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "eve",
            namr = "EVS_LOG_ERROR",
            dscr = "EVS_LOG_ERROR",
        }, {
            func(evs_log_erro, {}),
        }),
    },
})

