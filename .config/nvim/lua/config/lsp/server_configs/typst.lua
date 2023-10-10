local M = {}

M.setup = function(capabilities)
  require("lspconfig").typst_lsp.setup {
    settings = {
      exportPdf = "onSave",
    },
    capabilities = capabilities,
  }
end

return M
