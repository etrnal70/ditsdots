local dap = require("dap")
local dapui = require("dapui")

-- Keymapping
-- TODO: Make a command to attach to buffer
local bmap = function(type, key, value)
  vim.api.nvim_buf_set_keymap(0, type, key, value, { noremap = true, silent = true })
end
local gmap = function(type, key, value)
  vim.api.nvim_set_keymap(type, key, value, { noremap = true, silent = true })
end

-- DAP Keymap
-- TODO: All keymap should be buffer, not global
gmap("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>")
gmap("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>")
gmap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
gmap("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>")
gmap("n", "<leader>do", "<cmd>lua require('dap').step_out()<CR>")
gmap("n", "<leader>dO", "<cmd>lua require('dap').step_over()<CR>")
gmap("n", "<leader>dd", "<cmd>lua require('dapui').toggle()<CR>")
gmap("n", "<leader>di", "<cmd>lua require('dap.ui.variables').hover({},{border='solid'})<CR>")

-- Telescope keymap
gmap("n", "<leader>dlc", "<cmd>Telescope dap commands<CR>")
gmap("n", "<leader>dlC", "<cmd>Telescope dap configurations<CR>")
gmap("n", "<leader>dlb", "<cmd>Telescope dap list_breakpoints<CR>")
gmap("n", "<leader>dlv", "<cmd>Telescope dap variables<CR>")
gmap("n", "<leader>dlf", "<cmd>Telescope dap frames<CR>")

-- Set icon
-- TODO: Don't conflict with gitsigns
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })

-- Language-specific configuration
dap.adapters.lldb = {
  type = "executable",
  -- attach = {
  --   pidProperty = "pid",
  --   pidSelect = "ask",
  -- },
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
