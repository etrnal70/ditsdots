local M = {}

local opts = { noremap = true, silent = true }

local extension_path = vim.fn.expand("$HOME/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/")
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

local border = { " ", "FloatBorder" }

M.setup = function(on_attach, capabilities)
  require("rust-tools").setup({
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    tools = {
      autoSetHints = true,
      hover_with_actions = true,
      runnables = {
        use_telescope = true,
      },
      inlay_hints = {
        show_parameter_hints = false,
        parameter_hints_prefix = " » ",
        other_hints_prefix = "❱ ",
      },
      hover_actions = {
        border = {
          border,
          border,
          border,
          border,
          border,
          border,
          border,
          border,
        },
      },
    },
    server = {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        --[[ vim.api.nvim_buf_set_keymap(
          bufnr,
          "n",
          "K",
          "<cmd>lua require('rust-tools.hover_actions').hover_actions()<CR>",
          opts
        ) ]]
        vim.api.nvim_buf_set_keymap(
          bufnr,
          "v",
          "K",
          "<cmd>lua require('rust-tools.hover_range').hover_range()<CR>",
          opts
        )
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rr", "<cmd>RustRunnables<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rc", "<cmd>RustOpenCargo<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rh", "<cmd>RustHoverActions<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rmu", "<cmd>RustMoveItemUp<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rmd", "<cmd>RustMoveItemDown<CR>", opts)
      end,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 500,
      },
    },
  })
end

return M
