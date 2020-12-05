lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c", "rust", "cpp", "dart", "verilog", "bash", "toml" , "lua"
  },      -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {"ruby"},  -- list of language that will be disabled
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
        ["as"] = "@statement.outer",
        ["am"] = "@statement.outer",
        }
    },
    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
