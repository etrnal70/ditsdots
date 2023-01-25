local null_ls = require "null-ls"
local formatter = null_ls.builtins.formatting
local linter = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

local lsp_formatting = function(client, bufnr)
  vim.lsp.buf.format {
    bufnr = bufnr,
    filter = function()
      return client.name == "null-ls" or client.name == "clangd"
    end,
  }
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debounce = 250,
  log = { enable = false },
  on_attach = function(client, bufnr)
    -- Autoformat on save
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        lsp_formatting(client, bufnr)
      end,
      group = augroup,
    })
  end,
  sources = {
    -- Action
    action.gitrebase,
    action.shellcheck,
    -- Formatter
    formatter.dart_format,
    formatter.gofumpt,
    formatter.pg_format,
    formatter.prettierd.with {
      disabled_filetypes = { "javascript", "typescript" },
    },
    formatter.rome,
    formatter.rustfmt.with {
      extra_args = function(params)
        local Path = require "plenary.path"
        local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

        if cargo_toml:exists() and cargo_toml:is_file() then
          for _, line in ipairs(cargo_toml:readlines()) do
            local edition = line:match [[^edition%s*=%s*%"(%d+)%"]]
            if edition then
              return { "--edition=" .. edition }
            end
          end
        end
        -- default edition when we don't find `Cargo.toml` or the `edition` in it.
        return { "--edition=2021" }
      end,
    },
    formatter.taplo,
    formatter.shfmt.with {
      extra_args = function(utils)
        if utils.root_has_file ".editorconfig" then
          return {}
        end
        return { "-i", "2", "-ci", "-sr" }
      end,
    },
    formatter.stylua.with {
      condition = function(utils)
        return utils.root_has_file ".stylua.toml" or utils.root_has_file "stylua.toml"
      end,
    },
    formatter.sqlfluff,
    formatter.yapf,
    -- Diagnostics
    linter.buf,
    linter.flake8.with {
      condition = function(utils)
        return utils.root_has_file ".flake8" or utils.root_has_file "setup.cfg" or utils.root_has_file "tox.ini"
      end,
    },
    -- linter.revive,
    linter.hadolint,
    linter.shellcheck,
    linter.sqlfluff,
    linter.tsc.with {
      condition = function(utils)
        return utils.root_has_file "tsconfig.json"
      end,
    },
  },
}
