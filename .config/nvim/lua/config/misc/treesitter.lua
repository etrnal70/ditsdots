require("nvim-treesitter.configs").setup({
  context_commentstring = { enable = true },
  ensure_installed = "all",
  ignore_install = { "comment", "c" },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  incremental_selection = {
    enable = false,
  },
  indent = { enable = true },
  matchup = {
    disable = { "c", "cpp" },
    enable = true,
    disable_virtual_text = true,
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
      enable = true,
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
  textsubjects = {
    enable = true,
    prev_selection = ",",
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
      ["i;"] = "textsubjects-container-inner",
    },
  },
  playground = {
    enable = false,
    updatetime = 25,
    persist_queries = false,
  },
})
