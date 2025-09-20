local M = {}

M.setup = function(capabilities)
  vim.lsp.config("dockerls", {
    capabilities = capabilities,
  })
end

return M
