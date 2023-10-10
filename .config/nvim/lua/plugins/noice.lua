return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline",
      },
      messages = { enabled = false },
      popupmenu = { enabled = true },
      notify = {
        enabled = true,
        view = "mini",
        replace = true,
      },
      lsp = {
        hover = {
          opts = {
            size = { max_height = 19, max_width = 60 },
          },
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = false,
          ["cmp.entry.get_documentation"] = false,
        },
        progress = {
          enabled = true,
          format = {
            { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
            { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
            { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
          },
          opts = {
            size = {
              max_height = 4,
            },
          },
        },
        signature = { enabled = false },
      },
      health = { checker = false },
      views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
    },
  },
}
