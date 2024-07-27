local M = {}

M.setup = function(capabilities)
  require("lspconfig").graphql.setup {
    capabilities = capabilities,
  }
end

return M
