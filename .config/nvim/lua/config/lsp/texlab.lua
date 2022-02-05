local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").texlab.setup({
    settings = {
      texlab = {
        auxDirectory = "build",
        build = {
          -- latexmk
          executable = "latexmk",
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-outdir=build", "%f" },
          -- tectonic
          -- executable = "tectonic",
          -- args = { "--synctex", "--keep-logs", "--keep-intermediate", "--outdir", "build" },
          forwardSearchAfter = true,
          onSave = true,
        },
        forwardSearch = {
          executable = "zathura",
          args = { "--synctex-forward", "%l:1:%f", "%p" },
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
