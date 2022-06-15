local feline = require("feline")
local dap = require("dap")

local M = {}

local colors = {
  bg = "#212121",
  yellow = "#FABD2F",
  orange = "#FF8800",
  grey = "#757575",
  blue = "#A0B9D8",
  red = "#EC5F67",
}

local separator = {
  hl = {
    fg = "bg",
  },
  str = " ",
}

local winbar_components = {
  active = { {}, {}, {} },
  inactive = { {}, {} },
}
local statusline_components = {
  active = { {}, {}, {} },
  inactive = { {}, {} },
}

table.insert(winbar_components.active[1], {
  provider = {
    name = "file_info",
    opts = {
      type = "relative-short",
    },
  },
  enabled = function()
    return vim.api.nvim_buf_get_name(0) ~= ""
  end,
  hl = {
    bg = "NONE",
    style = "bold",
  },
  right_sep = {
    hl = { bg = "NONE" },
    str = " ",
  },
  left_sep = {
    hl = { bg = "NONE" },
    str = " ",
  },
})

table.insert(winbar_components.active[1], {
  provider = function()
    return require("nvim-navic").get_location()
  end,
  enabled = function()
    return require("nvim-navic").is_available()
  end,
  hl = {
    bg = "NONE",
  },
})

table.insert(winbar_components.inactive[1], {
  provider = {
    name = "file_info",
    opts = {
      type = "relative-short",
    },
  },
  enabled = function()
    return vim.api.nvim_buf_get_name(0) ~= ""
  end,
  hl = {
    bg = "NONE",
    style = "bold",
  },
  right_sep = {
    hl = { bg = "NONE" },
    str = " ",
  },
  left_sep = {
    hl = { bg = "NONE" },
    str = " ",
  },
})

table.insert(winbar_components.inactive[1], {
  provider = function()
    return require("nvim-navic").get_location()
  end,
  enabled = function()
    return require("nvim-navic").is_available()
  end,
  hl = {
    bg = "NONE",
  },
})

-- Active Components
table.insert(statusline_components.active[1], {
  provider = function()
    local mode = require("feline.providers.vi_mode").get_vim_mode()
    return " " .. mode:sub(1, 1) .. " "
  end,
  hl = {
    bg = "#3F3F3F",
    style = "bold",
  },
})

table.insert(statusline_components.active[1], {
  provider = function()
    return " "
  end,
})

table.insert(statusline_components.active[1], {
  provider = function()
    return require("gitblame").get_current_blame_text()
  end,
  enabled = function()
    return require("gitblame").is_blame_text_available()
  end,
  hl = {
    fg = "#888888",
  },
  left_sep = separator,
})

table.insert(statusline_components.active[1], {
  provider = function()
    return "[DEBUG] " .. dap.status()
  end,
  enabled = function()
    return dap.status() ~= ""
  end,
  hl = {
    fg = "bg",
    bg = colors.orange,
  },
  left_sep = separator,
})

table.insert(statusline_components.active[3], {
  provider = "file_encoding",
  hl = {
    style = "bold,italic",
  },
  right_sep = separator,
})

table.insert(statusline_components.active[3], {
  provider = "git_diff_added",
  hl = {
    fg = "green",
  },
  icon = "  ",
})

table.insert(statusline_components.active[3], {
  provider = "git_diff_changed",
  hl = {
    fg = colors.orange,
  },
  icon = "  ",
})

table.insert(statusline_components.active[3], {
  provider = "git_diff_removed",
  hl = {
    fg = "red",
  },
  icon = "  ",
})

table.insert(statusline_components.active[3], {
  provider = function()
    return " "
  end,
})

table.insert(statusline_components.active[3], {
  provider = "position",
  right_sep = separator,
})

M.setup = function()
  feline.setup({
    colors = {
      fg = "white",
      bg = "bg",
    },
    components = statusline_components,
    force_inactive = {
      filetypes = {},
      buftypes = {},
    },
  })
  feline.winbar.setup({
    colors = {
      -- fg = "white",
      bg = "NONE",
    },
    components = winbar_components,
    force_inactive = {
      filetypes = { "neo-tree" },
      buftypes = {},
    },
  })
end

return M
