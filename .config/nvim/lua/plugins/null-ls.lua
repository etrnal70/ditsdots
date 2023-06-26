return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require "null-ls"
      local formatter = null_ls.builtins.formatting
      local linter = null_ls.builtins.diagnostics
      local action = null_ls.builtins.code_actions

      local lsp_formatting = function(client, bufnr)
        vim.lsp.buf.format {
          bufnr = bufnr,
          filter = function()
            return client.name == "null-ls"
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
          formatter.pg_format,
          formatter.prettierd.with {
            disabled_filetypes = { "javascript", "typescript" },
          },
          formatter.rome,
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
          linter.hadolint,
          linter.mypy,
          linter.shellcheck,
          linter.sqlfluff,
          linter.tsc.with {
            condition = function(utils)
              return utils.root_has_file "tsconfig.json"
            end,
          },
        },
      }
    end,
  },
}
