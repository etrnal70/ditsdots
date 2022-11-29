local cmp = require("cmp")
local cmp_compare = require("cmp.config.compare")

-- Markdown
cmp.setup.filetype("markdown", {
  sources = {
    { name = "luasnip", option = { show_autosnippets = true } },
    { name = "emoji" },
    { name = "path" },
  },
})

-- Tex
cmp.setup.filetype("tex", {
  sources = {
    { name = "luasnip", max_item_count = 2, option = { show_autosnippets = true } },
    { name = "omni" },
    -- { name = "latex_symbols", max_item_count = 2 },
    { name = "path" },
  },
})

-- Python
-- cmp.setup.filetype("python", {
--   sorting = {
--     comparators = {
--       cmp_compare.locality,
--       cmp_compare.recently_used,
--       cmp_compare.score,
--       require("cmp-under-comparator").under,
--       cmp_compare.offset,
--       cmp_compare.order,
--     },
--   },
-- })

-- Toml
cmp.setup.filetype("toml", {
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
})

-- Gitcommit
cmp.setup.filetype("gitcommit", {
  sources = {
    { name = "luasnip", max_item_count = 2, option = { show_autosnippets = true } },
    { name = "conventionalcommits" },
    { name = "git" },
    { name = "emoji", insert = true },
  },
})

-- TelescopePrompt
cmp.setup.filetype("TelescopePrompt", {
  enabled = false,
})

-- SQL Family
cmp.setup.filetype({ "sql", "msql", "plsql" }, {
  { name = "luasnip", max_item_count = 2 },
  { name = "nvim_lsp" },
})
