local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").taplo.setup({
    cmd = { "taplo", "lsp", "stdio" },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
