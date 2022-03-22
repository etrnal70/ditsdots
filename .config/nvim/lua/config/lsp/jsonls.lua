local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").jsonls.setup({
    on_attach = on_attach,
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
      },
    },
    capabilities = capabilities,
  })
end

return M
