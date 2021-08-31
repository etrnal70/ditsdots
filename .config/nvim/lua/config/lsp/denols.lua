local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").denols.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 250,
    },
  })
end

return M
