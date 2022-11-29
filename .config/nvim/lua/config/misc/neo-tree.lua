require("window-picker").setup {
  current_win_hl_color = "#6699CC",
  other_win_hl_color = "#2F628E",
}
require("neo-tree").setup {
  open_files_in_last_window = false,
  close_if_last_window = true,
  follow_current_file = true,
  default_component_configs = {
    git_status = {
      symbols = {
        added = "✚",
        modified = "⏺",
      },
      align = "right",
    },
    modified = {
      symbol = "⏺",
    },
  },
  enable_diagnostics = false,
  enable_git_status = true,
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd "set cursorlineopt=both"
        vim.cmd "hi Cursor blend=100"
      end,
    },
    {
      event = "neo_tree_buffer_leave",
      handler = function()
        vim.cmd "hi Cursor blend=0"
        vim.cmd "set cursorlineopt=number"
      end,
    },
  },
  filesystem = {
    async_directory_scan = "always",
    hijack_netrw_behavior = "disabled",
    filtered_items = {
      hide_by_name = {
        "node_modules",
        "__pycache__",
      },
    },
  },
  sort_case_insensitive = true,
  use_libuv_file_watcher = true,
  popup_border_style = require("config.utils").transparent_border,
  window = {
    mappings = {
      ["<cr>"] = "open_with_window_picker",
      ["<c-x>"] = "split_with_window_picker",
      ["<c-v>"] = "vsplit_with_window_picker",
      ["s"] = "",
      ["S"] = "",
      ["<c-t>"] = "open_tabnew",
      o = function(state)
        vim.cmd("silent !xdg-open " .. state.tree:get_node():get_id())
      end,
      ["<C-z>"] = "clear_filter",
    },
    width = 35,
  },
}
