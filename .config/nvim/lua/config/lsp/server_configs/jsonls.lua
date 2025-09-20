local M = {}

M.setup = function(capabilities)
  vim.lsp.config("jsonls", {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
      },
    },
    capabilities = capabilities,
  })
end

return M
