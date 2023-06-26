local M = {}

M.setup = function(capabilities)
  require("lspconfig").dockerls.setup({
    capabilities = capabilities,
  })
end

return M
