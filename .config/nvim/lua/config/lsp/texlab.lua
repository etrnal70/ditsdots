local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").texlab.setup({
    settings = {
      texlab = {
        auxDirectory = "build",
        chktex = {
          onEdit = true,
        },
        build = {
          -- executable = "latexmk",
          -- args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-outdir=build", "%f" },
          executable = "tectonic",
          -- args = { "-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates", "--outdir", "build" },
          args = { "-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates", "--outdir", "build" },
          forwardSearchAfter = false,
          onSave = false,
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
