require("nvim-treesitter.configs").setup({
  context_commentstring = { enable = true },
  ensure_installed = "all",
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = ";",
      scope_incremental = ";",
      node_incremental = ".",
      node_decremental = ",",
    },
  },
  indent = { enable = true },
  matchup = {
    enable = true,
    include_match_words = true,
  },
  refactor = {
    highlight_definitions = { enable = false },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 5000,
  },
  textobjects = {
    select = {
      enable = false,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["is"] = "@statement.inner",
        ["as"] = "@statement.outer",
      },
    },
    move = { enable = false },
  },
  playground = {
    enable = false,
    updatetime = 25,
    persist_queries = false,
  },
})
