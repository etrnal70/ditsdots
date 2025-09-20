local M = {}

M.setup = function(capabilities)
  vim.lsp.config("marksman", {
    capabilities = capabilities,
  })
end

return M
