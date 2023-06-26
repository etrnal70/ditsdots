local M = {}

M.setup = function(capabilities)
  require("lspconfig").jsonls.setup({
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
      },
    },
    capabilities = capabilities,
  })
end

return M
