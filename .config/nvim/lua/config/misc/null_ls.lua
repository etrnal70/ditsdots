local null_ls = require("null-ls")
local formatter = null_ls.builtins.formatting
local linter = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

null_ls.setup({
  debounce = 500,
  log = {
    enable = false,
  },
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "<leader>ff",
      "",
      { callback = vim.lsp.buf.formatting_seq_sync, noremap = true, silent = true }
    )
    -- Autoformat on save
    -- vim.api.nvim_command("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
  end,
  sources = {
    -- Formatter
    formatter.clang_format,
    formatter.dart_format,
    formatter.deno_fmt,
    formatter.gofumpt,
    formatter.pg_format,
    formatter.prettierd,
    formatter.rustfmt,
    formatter.shfmt.with({
      extra_args = { "-i", "2", "-ci", "-sr" },
    }),
    formatter.stylua.with({
      condition = function(utils)
        return utils.root_has_file(".stylua.toml") or utils.root_has_file("stylua.toml")
      end,
    }),
    formatter.yapf,
    -- Diagnostics
    linter.chktex,
    linter.flake8,
    linter.hadolint,
    linter.markdownlint,
    linter.shellcheck,
    -- Code Actions
    action.shellcheck,
  },
})
