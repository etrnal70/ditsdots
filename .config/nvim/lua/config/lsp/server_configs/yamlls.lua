local M = {}

M.setup = function(capabilities)
  vim.lsp.config("yamlls", {
    settings = {
      yaml = {
        schemas = require("schemastore").json.schemas(),
      },
    },
    capabilities = capabilities,
  })
end

return M
