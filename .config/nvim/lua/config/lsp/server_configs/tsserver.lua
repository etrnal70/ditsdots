local M = {}

M.setup = function(capabilities)
  require("typescript").setup({
    server = {
      capabilities = capabilities,
    },
  })
end

return M
