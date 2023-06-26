local M = {}

M.setup = function(capabilities)
  require("lspconfig").pylyzer.setup {
    capabilities = capabilities,
    settings = {
      python = {
        checkOnType = false,
        diagnostics = true,
        inlayHints = true,
        smartCompletion = true,
      },
    },
  }
end

return M
