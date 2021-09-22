local npairs = require("nvim-autopairs")
local conds = require("nvim-autopairs.conds")
local rule = require("nvim-autopairs.rule")

npairs.setup({
  disable_filetype = { "TelescopePrompt" },
  enable_moveright = true,
  enable_afterquota = true,
  enable_check_bracket_line = true,
  check_ts = true,
})

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true,
  map_complete = true,
  auto_select = false,
  insert = false,
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

npairs.add_rules({
  rule("=", "")
    :with_pair(conds.not_inside_quote())
    :with_pair(function(opts)
      local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
      if last_char:match("[%w%=%s]") then
        return true
      end
      return false
    end)
    :replace_endpair(function(opts)
      local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
      local next_char = opts.line:sub(opts.col, opts.col)
      next_char = next_char == " " and "" or " "
      if prev_2char:match("%w$") then
        return "<bs> =" .. next_char
      end
      if prev_2char:match("%=$") then
        return next_char
      end
      if prev_2char:match("=") then
        return "<bs><bs>=" .. next_char
      end
      return ""
    end)
    :set_end_pair_length(0)
    :with_move(conds.none())
    :with_del(conds.none()),
})
