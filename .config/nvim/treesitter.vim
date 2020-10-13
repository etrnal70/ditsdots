lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",      -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {"ruby", "dart"},  -- list of language that will be disabled
  },
  refactor = {
    highlight_definitions = {enable = true},
    highlight_current_scope = {enable = false},
    smart_rename = {
        enable = true,
        keymaps = {
            smart_rename = "grr",
        }
    }
  },
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
