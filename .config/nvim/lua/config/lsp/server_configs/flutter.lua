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
      highlight = "Comment",
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
      -- color = {
      --   enabled = true,
      -- },
      on_attach = function(_, bufnr)
        local utils = require "config.utils"
        require("telescope").load_extension "flutter"
        utils.keymap(bufnr, "n", "<leader>Fl", ":Telescope flutter commands<CR>")
      end,
      capabilities = capabilities,
    },
  }
end

return M
