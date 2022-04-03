local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").tsserver.setup({
    init_options = require("nvim-lsp-ts-utils").init_options,
    on_attach = function(client, bufnr)
      local ts_utils = require("nvim-lsp-ts-utils")
      ts_utils.setup({
        auto_inlay_hints = false,
        enable_import_on_completion = true,
        update_import_on_move = true,
      })
      ts_utils.setup_client(client)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  })
end

return M
