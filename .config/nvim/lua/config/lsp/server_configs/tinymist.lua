local M = {}

M.setup = function(capabilities)
  vim.lsp.config("tinymist", {
    settings = {
      single_file_support = true,
    },
    capabilities = capabilities,
  })
end

return M
