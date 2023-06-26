local M = {}

M.setup = function(capabilities)
  require("lspconfig").marksman.setup({
    capabilities = capabilities,
  })
end

return M
