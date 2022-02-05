local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").tsserver.setup({
    on_attach = function(client, bufnr)
      local ts_utils = require("nvim-lsp-ts-utils")
      ts_utils.setup({
        enable_import_on_completion = true,
        update_import_on_move = true,
      })
      ts_utils.setup_client(client)
      on_attach(client, bufnr)
    end,
  })
end

return M
