local M = {}

M.setup = function(capabilities)
  vim.lsp.config("zls", {
    capabilities = capabilities,
  })
end

return M
