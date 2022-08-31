local null_ls = require("null-ls")
local formatter = null_ls.builtins.formatting
local linter = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(clients)
      return vim.tbl_filter(function(client)
        return client.name == "null-ls" or client.name == "clangd"
      end, clients)
    end,
    bufnr = bufnr,
  })
end

null_ls.setup({
  debounce = 250,
  log = { enable = false },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>sf", "", { callback = vim.lsp.buf.format })

      -- Autoformat on save
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   buffer = bufnr,
      --   callback = function()
      --     lsp_formatting(bufnr)
      --   end,
      -- })
    end
  end,
  sources = {
    -- Action
    action.gitrebase,
    action.shellcheck,
    -- Formatter
    linter.buf,
    -- formatter.clang_format,
    formatter.dart_format,
    -- formatter.deno_fmt,
    formatter.gofumpt,
    formatter.pg_format,
    formatter.prettierd,
    formatter.rustfmt.with({
      extra_args = function(params)
        local Path = require("plenary.path")
        local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

        if cargo_toml:exists() and cargo_toml:is_file() then
          for _, line in ipairs(cargo_toml:readlines()) do
            local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
            if edition then
              return { "--edition=" .. edition }
            end
          end
        end
        -- default edition when we don't find `Cargo.toml` or the `edition` in it.
        return { "--edition=2021" }
      end,
    }),
    formatter.taplo,
    formatter.shfmt.with({
      extra_args = function(utils)
        if utils.root_has_file(".editorconfig") then
          return {}
        end
        return { "-i", "2", "-ci", "-sr" }
      end,
    }),
    formatter.stylua.with({
      condition = function(utils)
        return utils.root_has_file(".stylua.toml") or utils.root_has_file("stylua.toml")
      end,
    }),
    formatter.sqlfluff,
    formatter.yapf,
    -- Diagnostics
    linter.chktex,
    linter.flake8.with({
      condition = function(utils)
        return utils.root_has_file(".flake8") or utils.root_has_file("setup.cfg") or utils.root_has_file("tox.ini")
      end,
    }),
    linter.golangci_lint,
    linter.hadolint,
    -- linter.markdownlint.with({
    --   extra_args = function(params)
    --     -- TODO: Detect configuration from GitHub workflow folder
    --     local Path = require("plenary.path")
    --     local json_file = Path:new(params.root .. "/" .. ".markdownlint.json")
    --     local jsonc_file = Path:new(params.root .. "/" .. ".markdownlint.jsonc")
    --     local yaml_file = Path:new(params.root .. "/" .. ".markdownlint.yaml")
    --
    --     if json_file:exists() and json_file:is_file() then
    --       return { "-c", json_file }
    --     end
    --     if jsonc_file:exists() and jsonc_file:is_file() then
    --       return { "-c", jsonc_file }
    --     end
    --     if yaml_file:exists() and yaml_file:is_file() then
    --       return { "-c", yaml_file }
    --     end
    --
    --     return {}
    --   end,
    -- }),
    linter.shellcheck,
    linter.sqlfluff,
  },
})
