local M = {}

M.setup = function(capabilities)
  require("lspconfig").pyright.setup {
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          typeCheckingMode = "strict",
          useLibraryCodeForTypes = true,
        },
      },
    },
  }
end

return M
