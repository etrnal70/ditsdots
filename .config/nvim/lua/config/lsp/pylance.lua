local M = {}

M.setup = function(on_attach, capabilities)
  require("pylance")
  require("lspconfig").pylance.setup({
    settings = {
      python = {
        analysis = {
          typecheckingMode = "strict",
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
