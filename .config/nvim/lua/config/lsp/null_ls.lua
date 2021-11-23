local null_ls = require("null-ls")
local formatter = null_ls.builtins.formatting
local linter = null_ls.builtins.diagnostics

local sources = {
  -- Formatter
  formatter.clang_format,
  formatter.dart_format,
  -- formatter.deno_fmt,
  formatter.gofumpt,
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
  linter.codespell.with({
    condition = function(utils)
      return utils.root_has_file("setup.cfg") or utils.root_has_file(".codespellrc")
    end,
  }),
  linter.flake8,
  -- linter.hadolint,
  linter.markdownlint,
  linter.shellcheck,
}

local M = {}

M.setup = function(on_attach, _)
  null_ls.config({
    sources = sources,
  })
  require("lspconfig")["null-ls"].setup({
    on_attach = on_attach,
  })
end

return M
