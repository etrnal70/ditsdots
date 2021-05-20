local dap = require("dap")
local dapui = require("dapui")

-- Keymapping
-- TODO: Make a command to attach to buffer
local bmap = function(type, key, value)
	vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end
local gmap = function(type, key, value)
	vim.api.nvim_set_keymap(type,key,value,{noremap = true, silent = true});
end
gmap('n','<leader>dc','<cmd>lua require("dap").continue()<CR>')
gmap('n','<leader>dr','<cmd>lua require("dap").repl.open()<CR>')
gmap('n','<leader>db','<cmd>lua require("dap").toggle_breakpoint()<CR>')
gmap('n','<leader>dl','<cmd>lua require("dap").step_into()<CR>')
gmap('n','<leader>dh','<cmd>lua require("dap").step_out()<CR>')
gmap('n','<leader>do','<cmd>lua require("dap").step_over()<CR>')
gmap('n','<leader>di','<cmd>lua require("dap.ui.variables").hover()<CR>')

-- Set icon
vim.fn.sign_define("DapBreakpoint", {text = "🛑",texthl = "",linehl = "",numhl = "",})
vim.fn.sign_define("DapLogpoint", {text = "",texthl = "",linehl = "",numhl = "",})
vim.fn.sign_define("DapStopped", {text = "🟢",texthl = "",linehl = "",numhl = "",})

-- Language-specific configuration
-- C/C++ and Rust
dap.adapters.cpp = {
  type = 'executable',
  attach = {
    pidProperty = "pid",
    pidSelect = "ask"
  },
  command = 'lldb-vscode',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
  },
  name = "lldb"
}
dap.adapters.rust = dap.adapters.cpp

-- Go (Delve DAP)
dap.adapters.go = function(callback, config)
  local handle
  local pid_or_err
  local port = 38697
  handle, pid_or_err =
  vim.loop.spawn(
  "dlv",
  {
    args = {"dap", "-l", "127.0.0.1:" .. port},
    detached = true
  },
  function(code)
    handle:close()
    print("Delve exited with exit code: " .. code)
  end
  )
  -- Wait 100ms for delve to start
  vim.defer_fn(
  function()
    --dap.repl.open()
    callback({type = "server", host = "127.0.0.1", port = port})
  end,
  100)
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}"
  }
}


-- DAP-UI Configuration
dapui.setup({
  icons = {
    expanded = "⯆",
    collapsed = "⯈",
    circular = "↺"
  },
  mappings = {
    expand = "<CR>",
    open = "o",
    remove = "d"
  },
  sidebar = {
    elements = {
      "scopes",
      "stacks",
      "watches"
    },
    width = 40,
    position = "left"
  },
  tray = {
    elements = {
      "repl"
    },
    height = 10,
    position = "bottom"
  },
  floating = {
    max_height = nil,
    max_width = nil
  }
})

-- Setup
local M = {}
local last_gdb_config

M.start_c_debugger = function(args, mi_mode, mi_debugger_path)
  local dap = require "dap"
  if args and #args > 0 then
    last_gdb_config = {
      type = "cpp",
      name = args[1],
      request = "launch",
      program = table.remove(args, 1),
      args = args,
      cwd = vim.fn.getcwd(),
      externalConsole = true,
      MIMode = mi_mode,
      MIDebuggerPath = mi_debugger_path,
    }
  end

  if not last_gdb_config then
    print('No binary to debug set! Use ":DebugC <binary> <args>" or ":DebugRust <binary> <args>"')
    return
  end

  dap.run(last_gdb_config)
  require('dap.ext.autocompl').attach()
end

return M
