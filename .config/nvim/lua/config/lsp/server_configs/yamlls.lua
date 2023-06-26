local M = {}

M.setup = function(capabilities)
  require("lspconfig").yamlls.setup({
    settings = {
      yaml = {
        schemas = require("schemastore").json.schemas(),
      },
    },
    capabilities = capabilities,
  })
end

return M
