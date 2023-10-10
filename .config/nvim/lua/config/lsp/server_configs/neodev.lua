local M = {}

M.setup = function(capabilities)
  require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  }
end

return M
