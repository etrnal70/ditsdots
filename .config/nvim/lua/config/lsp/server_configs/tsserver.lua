local M = {}

M.setup = function(capabilities)
  require("typescript-tools").setup {
    server = {
      capabilities = capabilities,
    },
  }
end

return M
