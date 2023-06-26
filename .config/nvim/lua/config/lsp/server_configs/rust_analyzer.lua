local M = {}

M.setup = function(capabilities)
  local dir_tbl = vim.fn.glob(vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-*", _, true)
  local ext_path = dir_tbl[#dir_tbl]
  local codelldb_path = ext_path .. "adapter/codelldb"
  local liblldb_path = ext_path .. "lldb/lib/liblldb.so"

  require("rust-tools").setup {
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    tools = {
      autoSetHints = false,
      executor = require("rust-tools.executors").toggleterm,
      hover_with_actions = false,
      inlay_hints = {
        auto = false,
      },
      -- TODO Check if dynamicRegistration fixed this
      on_initialized = function()
        vim.api.nvim_create_autocmd(
          { "BufEnter", "CursorHold", "InsertLeave" },
          { pattern = "*.rs", callback = vim.lsp.codelens.refresh }
        )
      end,
    },
    server = {
      -- cmd = { "ra-multiplex" },
      cargo = { allFeatures = true },
      standalone = false,
      capabilities = capabilities,
    },
  }
end

return M
