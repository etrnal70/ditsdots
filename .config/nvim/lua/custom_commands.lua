-- Debugger
vim.cmd [[
    command! -complete=file -nargs=* DebugC lua require "dap_config".start_c_debugger({<f-args>}, "gdb")
]]
vim.cmd [[
    command! -complete=file -nargs=* DebugRust lua require "dap_config".start_c_debugger({<f-args>}, "lldb", "rust-lldb")
]]
