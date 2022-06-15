local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").denols.setup({
    filetypes = { "typescript" },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
