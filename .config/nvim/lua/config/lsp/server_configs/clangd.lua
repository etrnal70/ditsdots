local M = {}

M.setup = function(capabilities)
  vim.lsp.config("clangd", {
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
  })
end

return M
