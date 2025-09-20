local M = {}

M.setup = function(capabilities)
  vim.lsp.config("pyright", {
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          typeCheckingMode = "strict",
          useLibraryCodeForTypes = true,
        },
      },
    },
  })
end

return M
