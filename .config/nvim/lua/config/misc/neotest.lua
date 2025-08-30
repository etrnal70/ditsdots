local M = {}

function M.setup()
  require("neotest").setup {
    adapters = {
      require "neotest-dart" {
        command = "flutter",
      },
      require "neotest-golang",
      require "rustaceanvim.neotest",
      require "neotest-jest",
      require "neotest-vitest",
      require "neotest-python",
    },
    floating = {
      border = "solid",
      max_height = 40,
      max_width = 60,
    },
    status = {
      signs = false,
      virtual_text = true,
    },
  }

  local map = require("config.utils").keymap

  map(_, "n", "ta", function()
    require("neotest").run.attach()
  end, { silent = true })
  map(_, "n", "tn", function()
    require("neotest").run.run()
  end, { silent = true })
  map(_, "n", "tf", function()
    require("neotest").run.run(vim.fn.expand "%")
  end, { silent = true })
  map(_, "n", "tl", function()
    require("neotest").run.run_last()
  end, { silent = true })
  map(_, "n", "td", function()
    require("neotest").run.run { strategy = "dap" }
  end, { silent = true })
  map(_, "n", "to", function()
    require("neotest").output.open { enter = true }
  end, { silent = true })
  map(_, "n", "ts", function()
    require("neotest").run.stop()
  end, { silent = true })
  map(_, "n", "tt", function()
    require("neotest").summary.toggle()
  end, { silent = true })
end

return M
