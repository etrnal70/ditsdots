-- Telescope keymap
-- map("n", "<leader>dlc", ":Telescope dap commands<CR>")
-- map("n", "<leader>dlC", ":Telescope dap configurations<CR>")
-- map("n", "<leader>dlb", ":Telescope dap list_breakpoints<CR>")
-- map("n", "<leader>dlv", ":Telescope dap variables<CR>")
-- map("n", "<leader>dlf", ":Telescope dap frames<CR>")

return {
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>dd",
        function()
          require("dapui").toggle()
        end,
      },
      {
        "<leader>df",
        function()
          require("dapui").float_element()
        end,
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        mode = { "n", "v" },
      },
    },
    dependencies = {
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
          enabled = false,
          clear_on_continue = false,
          virt_text_pos = "inline",
          show_stop_reason = false,
        },
      },
      { "stevearc/overseer.nvim" },
      {
        "mfussenegger/nvim-dap",
        keys = {
          {
            "<leader>dc",
            function()
              require("dap").continue()
            end,
          },
          {
            "<leader>dC",
            function()
              require("dap").reverse_continue()
            end,
          },
          {
            "<leader>db",
            function()
              require("dap").toggle_breakpoint()
            end,
          },
          {
            "<leader>dB",
            function()
              require("dap").clear_breakpoints()
            end,
          },
          {
            "<leader>di",
            function()
              require("dap").step_in()
            end,
          },
          {
            "<leader>do",
            function()
              require("dap").step_out()
            end,
          },
          {
            "<leader>dO",
            function()
              require("dap").step_over()
            end,
          },
          {
            "<leader>dr",
            function()
              require("dap").restart()
            end,
          },
          {
            "<leader>dt",
            function()
              require("dap").terminate()
            end,
          },
          { "<leader>dL", "<cmd>DapLoadLaunchJSON<CR>" },
          {
            "<leader>du",
            function()
              require("dap").up()
            end,
          },
          {
            "<leader>dU",
            function()
              require("dap").down()
            end,
          },
        },
        config = function()
          require("overseer").patch_dap(true)
          local dap = require "dap"
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
          require("dap.ext.vscode").load_launchjs()
        end,
      },
      {
        "nvim-telescope/telescope-dap.nvim",
        config = function()
          require("telescope").load_extension "dap"
        end,
      },
    },
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
    config = function()
      require("dapui").setup {
        mappings = {
          expand = "<CR>",
          open = "o",
          remove = "d",
        },
        floating = {
          border = require("config.utils").transparent_border,
          max_width = 60,
          max_height = 19,
        },
      }
    end,
  },
  {
    "LiadOz/nvim-dap-repl-highlights",
    config = true,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = "rcarriga/nvim-dap-ui",
    config = function()
      require("dap-python").setup(vim.fn.exepath "python")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "rcarriga/nvim-dap-ui",
    opts = {
      delve = {
        args = { "--check-go-version=false" },
      },
    },
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    ft = { "javascript", "typescript" },
    dependencies = "rcarriga/nvim-dap-ui",
  },
}
