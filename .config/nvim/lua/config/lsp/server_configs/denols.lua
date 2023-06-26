local M = {}

M.setup = function(capabilities)
  require("lspconfig").denols.setup {
    filetypes = { "typescript" },
    capabilities = capabilities,
    root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
  }
end

return M
