local M = {}

M.setup = function(capabilities)
  vim.lsp.config("taplo", {
    capabilities = capabilities,
  })
end

return M
