return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        context_commentstring = { enable = true },
        highlight = {
          enable = true,
          use_languagetree = true,
          disable = function(_, buf)
            local max_filesize = 4000 * 1024 -- 4 MB
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        incremental_selection = { enable = false },
        indent = { enable = true },
        matchup = {
          enable = true,
          disable_virtual_text = true,
          include_match_words = true,
          enable_quotes = true,
        },
        refactor = {
          highlight_definitions = { enable = false },
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
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      {
        "chrisgrieser/nvim-various-textobjs",
        config = function()
          require("various-textobjs").setup { useDefaultKeymaps = true }
        end,
      },
      "nvim-treesitter/nvim-treesitter-refactor",
      "RRethy/nvim-treesitter-textsubjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      {
        "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
        init = function()
          local rainbow_delimiters = require "rainbow-delimiters"

          vim.g.rainbow_delimiters = {
            strategy = { [""] = rainbow_delimiters.strategy["global"] },
            query = {
              [""] = "rainbow-delimiters",
              lua = "rainbow-blocks",
            },
          }
        end,
      },
      { "danymat/neogen", config = true },
      {
        "nvim-treesitter/nvim-treesitter-context",
        config = true,
      },
      {
        "andymass/vim-matchup",
        init = function()
          vim.g.matchup_matchparen_deferred = 1
          vim.g.matchup_matchparen_offscreen = {}
        end,
      },
    },
  },
}
