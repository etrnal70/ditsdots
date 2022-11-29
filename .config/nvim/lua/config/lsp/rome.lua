local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").rome.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = require("lspconfig").util.root_pattern("rome.json"),
  })
end

return M
