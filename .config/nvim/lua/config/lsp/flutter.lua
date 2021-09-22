local M = {}

local opts = { noremap = true, silent = true }

M.setup = function(on_attach, capabilities)
  require("flutter-tools").setup({
    decorations = {
      statusline = {
        app_version = true,
        device = false,
      },
    },
    experimental = {
      lsp_derive_paths = true,
    },
    flutter_lookup_cmd = nil,
    debugger = {
      enabled = true,
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
      auto_open_browser = false,
    },
    outline = {
      open_cmd = "35vnew",
      auto_open = false,
    },
    lsp = {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        require("telescope").load_extension("flutter")
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fl", "<cmd>Telescope flutter commands<CR>", opts)
      end,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 500,
      },
      settings = {
        showTodos = true,
        completeFunctionCalls = false,
        analysisExcludedFolders = { vim.fn.expand("$HOME/.sdk_dir/flutter/packages") },
      },
    },
  })
end

return M
