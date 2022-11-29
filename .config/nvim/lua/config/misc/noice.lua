require("noice").setup({
  cmdline = { enabled = false },
  messages = { enabled = false },
  popupmenu = { enabled = true },
  notify = { enabled = false },
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
      enabled = false,
      format = {
        { "{spinner} ", hl_group = "NoiceLspProgressTitle" },
        { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
        { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
      },
      opts = {
        size = {
          height = 4,
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
})
