local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").sumneko_lua.setup(require("lua-dev").setup({
    library = {
      vimruntime = true,
      types = true,
      plugins = true,
    },
    lspconfig = {
      settings = {
        Lua = {
          completion = { callSnippet = "Disable" },
          workspace = { maxPreload = 8000 },
        },
      },
      on_attach = on_attach,
      capabilities = capabilities,
    },
  }))
end

return M
