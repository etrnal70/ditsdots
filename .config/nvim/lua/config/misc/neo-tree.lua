require("neo-tree").setup({
  close_if_last_window = true,
  commands = {
    system_open = function(state)
      vim.cmd("silent !xdg-open " .. state.tree:get_node():get_id())
    end,
  },
  default_component_configs = {
    git_status = {
      symbols = {
        added = "✚",
        modified = "⏺",
      },
      align = "right",
    },
  },
  enable_diagnostics = false,
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd("set cursorlineopt=both")
        vim.cmd("hi Cursor blend=100")
      end,
    },
    {
      event = "neo_tree_buffer_leave",
      handler = function()
        vim.cmd("set cursorlineopt=number")
        vim.cmd("hi Cursor blend=0")
      end,
    },
  },
  filesystem = {
    hijack_netrw_behavior = "disabled",
    filtered_items = {
      hide_by_name = {
        "node_modules",
        "__pycache__",
      },
    },
  },
  popup_border_style = "double",
  sort_case_insensitive = true,
  window = {
    mappings = {
      ["<C-x>"] = "open_split",
      ["<C-v>"] = "open_vsplit",
      ["o"] = "system_open",
      ["Z"] = "clear_filter",
    },
  },
})
