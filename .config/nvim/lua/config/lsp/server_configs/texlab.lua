local M = {}

M.setup = function(capabilities)
  vim.lsp.config("texlab", {
    settings = {
      texlab = {
        auxDirectory = "build",
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
    capabilities = capabilities,
  })
end

return M
