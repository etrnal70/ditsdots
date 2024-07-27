local M = {}

M.setup = function(capabilities)
  require("lspconfig").clangd.setup {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    extensions = { autoSetHints = false },
    server = {
      -- cmd = { "clangd", "--offset-encoding=utf-16", "--clang-tidy", "--completion-style=bundled", "--malloc-trim" },
      cmd = { "clangd", "--clang-tidy", "--completion-style=bundled", "--malloc-trim" },
      init_options = {
        clangdFileStatus = true,
      },
      capabilities = capabilities,
    },
  }
end

return M
