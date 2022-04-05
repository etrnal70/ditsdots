require("neo-tree").setup({
  close_if_last_window = true,
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
      event = "file_open_requested",
      handler = function(args)
        if args.state.current_position == "current" then
          return
        end
        local path = args.path
        local cmd = args.open_cmd

        if cmd == "tabnew" then
          vim.cmd(cmd)
          vim.cmd("edit " .. vim.fn.fnameescape(path))
          return { handled = true }
        end
        local picked_window_id = require("window-picker").pick_window()
        if picked_window_id then
          vim.api.nvim_set_current_win(picked_window_id)
          vim.cmd(cmd)
          vim.cmd("edit " .. vim.fn.fnameescape(path))
        end
        return { handled = true }
      end,
    },
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
        vim.cmd("hi Cursor blend=0")
        vim.cmd("set cursorlineopt=number")
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
  use_libuv_file_watcher = true,
  popup_border_style = "double",
  sort_case_insensitive = true,
  window = {
    mappings = {
      ["<C-t>"] = "open_tabnew",
      ["<C-x>"] = "open_split",
      ["<C-v>"] = "open_vsplit",
      o = function(state)
        vim.cmd("silent !xdg-open " .. state.tree:get_node():get_id())
      end,
      ["<C-z>"] = "clear_filter",
    },
    width = 35,
  },
})
