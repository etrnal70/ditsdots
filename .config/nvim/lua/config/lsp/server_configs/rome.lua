local M = {}

M.setup = function(capabilities)
  require("lspconfig").rome.setup({
    capabilities = capabilities,
    root_dir = require("lspconfig").util.root_pattern("rome.json"),
  })
end

return M
