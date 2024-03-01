return {
  -- Linter
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        dockerfile = { "hadolint" },
        gitcommit = { "commitlint" },
        go = { "golangcilint" },
        sh = { "shellcheck" },
        bash = { "shellcheck" },
        sql = { "sqlfluff" },
        yaml = { "yamllint" },
        zsh = { "zsh" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        injected = {
          options = {
            ignore_errors = true,
            lang_to_formatters = {
              json = { "jq" },
              sql = { "sqlfluff" },
            },
          },
        },
      },
      formatters_by_ft = {
        javascript = { "prettierd" },
        lua = { "stylua" },
        python = { "isort", "black" },
        sql = { "sqlfluff" },
        toml = { "taplo" },
        yaml = { "yamlfmt" },
      },
    },
  },
  -- Language support
  {
    "crispgm/nvim-go",
    ft = { "go", "gomod", "gowork", "gohtmltmpl" },
    build = ":GoInstallBinaries",
    opts = {
      auto_lint = false,
      auto_format = false,
      maintain_cursor_pos = true,
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    ft = { "markdown", "neorg", "org" },
    opts = {
      markdown = {
        headline_highlights = false,
      },
    },
  },
  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    init = function()
      vim.g.disable_rainbow_hover = 1
    end,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },
}
