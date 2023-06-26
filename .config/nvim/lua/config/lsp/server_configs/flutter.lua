local M = {}

M.setup = function(capabilities)
  require("flutter-tools").setup {
    ui = {
      border = require("config.utils").transparent_border,
      notification_style = "native",
    },
    experimental = {
      lsp_derive_paths = true,
    },
    debugger = {
      enabled = true,
      run_via_dap = true,
    },
    widget_guides = {
      enabled = true,
    },
    closing_tags = {
      highlight = "Special",
      prefix = " ❱ ",
    },
    dev_log = {
      open_cmd = "tabnew",
    },
    dev_tools = {
      autostart = true,
      auto_open_browser = true,
    },
    outline = {
      open_cmd = "35vnew",
      auto_open = false,
    },
    lsp = {
      on_attach = function(client, bufnr)
        local utils = require "config.utils"
        require("document-color").buf_attach(bufnr)
        require("telescope").load_extension "flutter"
        utils.buf_map(bufnr, "n", "<leader>Fl", ":Telescope flutter commands<CR>")
      end,
      capabilities = capabilities,
    },
  }
end

return M
