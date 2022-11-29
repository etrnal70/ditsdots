local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").denols.setup({
    filetypes = { "typescript" },
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
  })
end

return M
