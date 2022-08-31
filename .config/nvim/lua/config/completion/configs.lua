local npairs = require("nvim-autopairs")
local rule = require("nvim-autopairs.rule")

local M = {}

M.load_luasnip = function()
  require("luasnip").config.setup({
    history = false,
    delete_check_events = "InsertLeave",
    region_check_events = "InsertEnter",
  })
  require("luasnip.loaders.from_vscode").lazy_load()
end

M.load_autopairs = function()
  npairs.setup({
    check_ts = true,
  })

  npairs.add_rules({
    rule("$$", "$$", "tex"):with_pair(function(opts)
      print(vim.inspect(opts))
      if opts.line == "aa $$" then
        return false
      end
    end),
  })
end

return M
