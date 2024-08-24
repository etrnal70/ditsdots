return {

  {
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    opts = { highlights = { duration = 0 } },
  },
  {
    "andrewferrier/textobj-diagnostic.nvim",
    event = "BufWinEnter",
    config = true,
  },
  {
    "Darazaki/indent-o-matic",
    event = "BufWinEnter",
    opts = {
      max_lines = 5000,
    },
  },
  {
    "jbyuki/venn.nvim",
    init = function()
      vim.api.nvim_create_user_command("VennToggle", require("config.misc.venn").toggle_venn, {})
    end,
  },
  {
    "tzachar/local-highlight.nvim",
    event = "BufReadPre",
    opts = {
      disable_file_types = { "Glance", "neo-tree" },
    },
  },
  {
    "glepnir/hlsearch.nvim",
    event = "BufWinEnter",
    config = true,
  },
}
