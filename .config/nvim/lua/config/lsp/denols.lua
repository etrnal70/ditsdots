local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").denols.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = false,
  })
end

return M
