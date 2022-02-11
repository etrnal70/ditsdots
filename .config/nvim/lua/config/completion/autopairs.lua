local npairs = require("nvim-autopairs")
local conds = require("nvim-autopairs.conds")
local rule = require("nvim-autopairs.rule")

npairs.setup({
  check_ts = true,
})

-- Custom Rules (might be refactored to new file)
npairs.add_rules({
  rule("$", "$", { "tex", "latex" })
    :with_pair(conds.not_after_regex_check("%%"))
    :with_pair(conds.not_before_regex_check("xxx", 3))
    :with_move(conds.none())
    :with_del(conds.not_after_regex_check("xx"))
    :with_cr(conds.none()),
})

npairs.add_rules({
  rule("$$", "$$", "tex"):with_pair(function(opts)
    print(vim.inspect(opts))
    if opts.line == "aa $$" then
      return false
    end
  end),
})
