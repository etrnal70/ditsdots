local dap = require("dap")
local dapui = require("dapui")

-- Keymapping
local map = function(mode, l, r, opts)
  opts = opts or {}
  vim.keymap.set(mode, l, r, opts)
end

-- DAP Keymap
map("n", "<leader>dc", dap.continue)
map("n", "<leader>dC", dap.reverse_continue)
map("n", "<leader>db", dap.toggle_breakpoint)
map("n", "<leader>dB", dap.clear_breakpoints)
map("n", "<leader>di", dap.step_into)
map("n", "<leader>do", dap.step_out)
map("n", "<leader>dO", dap.step_over)
map("n", "<leader>dr", dap.repl.toggle)
map("n", "<leader>dt", dap.terminate)
map("n", "<leader>dd", dapui.toggle)
map("n", "<leader>df", dapui.float_element)
map({ "n", "v" }, "<leader>de", dapui.eval)
map("n", "<leader>du", dap.up)
map("n", "<leader>dU", dap.down)

-- Telescope keymap
map("n", "<leader>dlc", ":Telescope dap commands<CR>")
map("n", "<leader>dlC", ":Telescope dap configurations<CR>")
map("n", "<leader>dlb", ":Telescope dap list_breakpoints<CR>")
map("n", "<leader>dlv", ":Telescope dap variables<CR>")
map("n", "<leader>dlf", ":Telescope dap frames<CR>")

-- Set icon
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#EC5F67" })
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#99C794" })
vim.fn.sign_define("DapBreakpoint", { text = "⬤", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⬤", texthl = "DapStopped", linehl = "", numhl = "" })

-- Language-specific configuration
dap.adapters.lldb = {
  type = "executable",
  command = "lldb-vscode",
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES",
  },
  name = "lldb",
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = vim.fn.getcwd(),
    stopOnEntry = false,
    args = {},
    runInterminal = false,
  },
}
dap.configurations.c = dap.configurations.cpp

-- DAP-UI Configuration
dapui.setup({
  mappings = {
    expand = "<CR>",
    open = "o",
    remove = "d",
  },
})

require("dap.ext.vscode").load_launchjs()
