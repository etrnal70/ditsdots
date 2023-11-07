local M = {}

M.setup = function(capabilities)
  local config = {
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
      cargo = { allFeatures = true },
      standalone = false,
      capabilities = capabilities,
    },
  }

  local dir_tbl = vim.fn.glob(vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-*", _, true)
  local ext_path = dir_tbl[#dir_tbl]
  if ext_path ~= nil then
    local codelldb_path = ext_path .. "adapter/codelldb"
    local liblldb_path = ext_path .. "lldb/lib/liblldb.so"
    vim.tbl_extend(
      "keep",
      config,
      { dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      } }
    )
  end

  require("rust-tools").setup { config }
end

return M
