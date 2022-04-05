require("pretty-fold").setup({
  keep_indentation = true,
  fill_char = "•",
  matchup_patterns = {
    { "^%s*do$", "end" }, -- `do ... end` blocks
    { "^%s*if", "end" }, -- if
    { "^%s*for", "end" }, -- for
    { "function%s*%(", "end" }, -- 'function(' or 'function ('
    { "{", "}" },
    { "%(", ")" }, -- % to escape lua pattern char
    { "%[", "]" }, -- % to escape lua pattern char
  },
  sections = {
    left = {
      "+",
      function()
        return string.rep("-", vim.v.foldlevel)
      end,
      " ",
      "number_of_folded_lines",
      ":",
      "content",
    },
  },
})
require("pretty-fold.preview").setup({ key = "h" })
