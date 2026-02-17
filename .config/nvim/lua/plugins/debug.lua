return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "igorlfs/nvim-dap-view",
      "Jorenar/nvim-dap-disasm",
      "stevearc/overseer.nvim",
    },
    config = function()
      require "config.debugger"
      -- require("overseer").patch_dap(true)
    end,
    init = function()
      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "", texthl = "DapBreakpointCondition", linehl = "DapLineBreakpointCondition", numhl = "" }
      )
      vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogpoint", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapLineStopped", numhl = "" })
    end,
  },
  {
    "LiadOz/nvim-dap-repl-highlights",
    config = true,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-python").setup(vim.fn.exepath "python")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    opts = {
      delve = {
        args = { "--check-go-version=false" },
      },
    },
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    ft = { "javascript", "typescript" },
    dependencies = "mfussenegger/nvim-dap",
  },
}
