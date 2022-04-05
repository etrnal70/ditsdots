local feline = require("feline")
local dap = require("dap")

local M = {}

local colors = {
  bg = "#212121",
  white = "#FFFFFF",
  yellow = "#FABD2F",
  orange = "#FF8800",
  grey = "#757575",
  blue = "#61AFEF",
  red = "#EC5F67",
}

feline.use_theme(colors)

local separator = {
  hl = {
    fg = "bg",
  },
  str = " ",
}

local components = {
  active = { {}, {}, {} },
  inactive = { {}, {} },
}

-- Active Components
table.insert(components.active[1], {
  provider = function()
    if dap.status() ~= "" then
      return "[DEBUG] " .. dap.status()
    end
    return require("nvim-gps").get_location()
  end,
  enabled = function()
    return require("nvim-gps").is_available() and dap.status() == ""
  end,
  hl = {
    fg = "white",
  },
  left_sep = separator,
})

table.insert(components.active[1], {
  provider = function()
    return "[DEBUG] " .. dap.status()
  end,
  enabled = function()
    return dap.status() ~= ""
  end,
  hl = {
    fg = "bg",
    bg = "orange",
  },
  left_sep = separator,
})

table.insert(components.active[3], {
  provider = {
    name = "file_info",
    opts = {
      type = "relative-short",
    },
  },
  hl = {
    fg = "white",
  },
  left_sep = separator,
})

table.insert(components.active[3], {
  provider = "git_diff_added",
  hl = {
    fg = "green",
  },
  icon = " ",
})

table.insert(components.active[3], {
  provider = "git_diff_changed",
  hl = {
    fg = "orange",
  },
  icon = " ",
})

table.insert(components.active[3], {
  provider = "git_diff_removed",
  hl = {
    fg = "red",
  },
  icon = " ",
})

table.insert(components.active[3], {
  provider = function()
    return "  "
  end,
})

M.setup = function()
  feline.setup({
    colors = {
      fg = "white",
      bg = "bg",
    },
    components = components,
    force_inactive = {
      filetypes = {},
      buftypes = {},
    },
  })
end

return M
