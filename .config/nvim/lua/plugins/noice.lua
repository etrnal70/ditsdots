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
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
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
            win_options = {
              winblend = 100,
              winhighlight = {
                Normal = "Normal",
              },
            },
          },
        },
        signature = { enabled = false },
      },
      health = { checker = false },
    },
  },
}
