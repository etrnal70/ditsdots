local M = {}

local extension_path = vim.fn.expand("$HOME/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/")
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

M.setup = function(on_attach, capabilities)
  require("rust-tools").setup({
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    tools = {
      autoSetHints = false,
      inlay_hints = {
        show_parameter_hints = false,
        parameter_hints_prefix = " » ",
        other_hints_prefix = " ❱ ",
      },
      hover_actions = {
        border = "solid",
        auto_focus = false,
      },
    },
    server = {
      on_attach = function(client, bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        on_attach(client, bufnr)
        map("n", "K", require("rust-tools.hover_actions").hover_actions)
        map("v", "K", require("rust-tools.hover_range").hover_range)
        map("n", "<leader>Rr", "<cmd>RustRunnables<CR>")
        map("n", "<leader>Rc", "<cmd>RustOpenCargo<CR>")
        map("n", "<leader>Rh", "<cmd>RustHoverActions<CR>")
        map("n", "<leader>Rmu", "<cmd>RustMoveItemUp<CR>")
        map("n", "<leader>Rmd", "<cmd>RustMoveItemDown<CR>")
      end,
      capabilities = capabilities,
    },
  })
end

return M
