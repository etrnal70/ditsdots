local M = {}

M.setup = function(capabilities)
  require("lspconfig").prismals.setup({
    capabilities = capabilities,
  })
end

return M
