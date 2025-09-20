local M = {}

M.setup = function(capabilities)
  vim.lsp.config("graphql", {
    capabilities = capabilities,
  })
end

return M
