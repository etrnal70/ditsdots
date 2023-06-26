local M = {}

M.setup = function(capabilities)
  require("lspconfig").taplo.setup({
    capabilities = capabilities,
  })
end

return M
