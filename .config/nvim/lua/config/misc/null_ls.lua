local null_ls = require("null-ls")
local formatter = null_ls.builtins.formatting
local linter = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

null_ls.setup({
  debounce = 250,
  log = { enable = false },
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ff", "", { callback = vim.lsp.buf.formatting_seq_sync })

    -- Autoformat on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.formatting_seq_sync()
      end,
    })
  end,
  sources = {
    -- Formatter
    -- formatter.clang_format,
    formatter.dart_format,
    formatter.deno_fmt,
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
    formatter.yapf,
    -- Diagnostics
    linter.chktex,
    linter.flake8.with({
      condition = function(utils)
        return utils.root_has_file(".flake8") or utils.root_has_file("setup.cfg") or utils.root_has_file("tox.ini")
      end,
    }),
    linter.hadolint,
    linter.markdownlint.with({
      extra_args = function(params)
        -- TODO: Detect configuration from GitHub workflow folder
        local Path = require("plenary.path")
        local json_file = Path:new(params.root .. "/" .. ".markdownlint.json")
        local jsonc_file = Path:new(params.root .. "/" .. ".markdownlint.jsonc")
        local yaml_file = Path:new(params.root .. "/" .. ".markdownlint.yaml")

        if json_file:exists() and json_file:is_file() then
          return { "-c", json_file }
        end
        if jsonc_file:exists() and jsonc_file:is_file() then
          return { "-c", jsonc_file }
        end
        if yaml_file:exists() and yaml_file:is_file() then
          return { "-c", yaml_file }
        end

        return {}
      end,
    }),
    linter.shellcheck,
  },
})
