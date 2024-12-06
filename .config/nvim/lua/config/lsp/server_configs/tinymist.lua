local M = {}

M.setup = function(capabilities)
  require("lspconfig").tinymist.setup {
    settings = {
      single_file_support = true,
    },
    capabilities = capabilities,
  }
end

return M
