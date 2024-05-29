local cmp = require "cmp"

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})

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
    { name = "luasnip", option = { show_autosnippets = true } },
    { name = "nvim_lsp" },
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
    { name = "luasnip",            option = { show_autosnippets = true } },
    { name = "conventionalcommits" },
    { name = "git" },
    { name = "emoji",              insert = true },
  },
})

-- SQL Family
cmp.setup.filetype({ "sql", "msql", "plsql" }, {
  { name = "luasnip" },
  { name = "nvim_lsp" },
})

-- nvim-dap
cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
})

-- Blacklisted filetypes
cmp.setup.filetype({ "TelescopePrompt", "neo-tree", "neo-tree-popup" }, {
  enabled = false,
})
