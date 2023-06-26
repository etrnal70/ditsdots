local M = {}

M.setup = function(capabilities)
  require("clangd_extensions").setup {
    extensions = { autoSetHints = false },
    server = {
      cmd = { "clangd", "--offset-encoding=utf-16", "--clang-tidy", "--completion-style=bundled", "--malloc-trim" },
      init_options = {
        clangdFileStatus = true,
      },
      capabilities = capabilities,
    },
  }
end

return M
