local M = {}

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
      auto_open_browser = true,
    },
    outline = {
      open_cmd = "35vnew",
      auto_open = false,
    },
    lsp = {
      on_attach = function(client, bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        on_attach(client, bufnr)
        require("telescope").load_extension("flutter")
        map("n", "<leader>Fl", ":Telescope flutter commands<CR>")
      end,
      capabilities = capabilities,
      settings = {
        showTodos = true,
        completeFunctionCalls = false,
        analysisExcludedFolders = { vim.fn.expand("$HOME/.sdk_dir/flutter/packages") },
      },
    },
  })
end

return M
