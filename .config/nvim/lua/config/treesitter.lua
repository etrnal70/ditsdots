local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

require("nvim-treesitter.configs").setup({
  context_commentstring = {
    enable = true,
  },
  ensure_installed = "all",
  ignore_installed = {},
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = {},
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
  refactor = {
    highlight_definitions = { enable = false },
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 2000,
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
    move = {
      enable = false,
    },
  },
  playground = {
    enable = false,
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
})
