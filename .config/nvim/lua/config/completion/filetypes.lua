local cmp = require("cmp")

-- C/C++
cmp.setup.filetype({ "c", "cpp", "h", "hpp" }, {
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      require("clangd_extensions.cmp_scores"),
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
})

-- Markdown
cmp.setup.filetype("markdown", {
  sources = {
    { name = "luasnip" },
    { name = "path" },
  },
})

-- Tex
cmp.setup.filetype("tex", {
  sources = {
    { name = "luasnip", max_item_count = 2 },
    { name = "nvim_lsp" },
    { name = "latex_symbols", max_item_count = 2 },
    { name = "path" },
  },
})

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
    { name = "luasnip", max_item_count = 2 },
    { name = "cmp_git" },
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
  { name = "vim-dadbod-completion" },
})
