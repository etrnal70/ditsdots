local M = {}

M.setup = function(capabilities)
  vim.lsp.config("prismals", {
    capabilities = capabilities,
  })
end

return M
