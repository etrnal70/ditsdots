local feline = require("feline")
local lsp = require("feline.providers.lsp")
local status = require("lsp-status")

local colors = {
  bg = "#181818",
  white = "#FFFFFF",
  yellow = "#FABD2F",
  orange = "#FF8800",
  grey = "#757575",
  dark_grey = "#444444",
  blue = "#61AFEF",
  red = "#EC5F67",
}

local components = {
  active = { {}, {}, {} },
  inactive = { {}, {} },
}

-- Active Components
table.insert(components.active[1], {
  provider = function()
    return require("nvim-gps").get_location()
  end,
  enabled = function()
    return require("nvim-gps").is_available()
  end,
  hl = {
    fg = colors.white,
    bg = colors.bg,
  },
  right_sep = {
    hl = {
      bg = colors.bg,
    },
    str = " ",
  },
})

table.insert(components.active[1], {
  provider = function()
    -- TODO: Improve handling
    local res = {}
    local config = {
      spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
    }

    local buf_message = status.messages()
    for _, msg in ipairs(buf_message) do
      local contents = ""
      if msg.progress then
        contents = msg.title
        if msg.message then
          contents = contents
        end

        if msg.percentage then
          contents = contents
        end

        if msg.spinner then
          contents = contents .. " " .. config.spinner_frames[(msg.spinner % #config.spinner_frames) + 1]
        end
      end

      table.insert(res, contents)
    end

    return vim.trim(table.concat(res, " "))
  end,
  enabled = function()
    return lsp.is_lsp_attached
  end,
  hl = {
    fg = colors.grey,
  },
  left_sep = {
    hl = {
      fg = colors.bg,
      bg = colors.bg,
    },
    str = "  ",
  },
})

table.insert(components.active[3], {
  provider = "file_info",
  type = "relative-short",
  hl = {
    fg = colors.white,
  },
  left_sep = {
    str = " ",
  },
})

table.insert(components.active[3], {
  provider = "git_diff_added",
  hl = {
    fg = "green",
  },
  icon = " +",
})

table.insert(components.active[3], {
  provider = "git_diff_changed",
  hl = {
    fg = "orange",
  },
  icon = " ~",
})

table.insert(components.active[3], {
  provider = "git_diff_removed",
  hl = {
    fg = "red",
  },
  icon = " -",
})

table.insert(components.active[3], {
  provider = "position",
  hl = {
    fg = colors.grey,
  },
  right_sep = {
    str = "  ",
  },
  left_sep = {
    str = "  ",
  },
})

-- Inactive Components
table.insert(components.inactive[2], {
  provider = "file_info",
  type = "relative-short",
  colored_icon = false,
  hl = {
    fg = colors.grey,
  },
  left_sep = {
    str = " ",
  },
})

table.insert(components.inactive[2], {
  provider = "position",
  hl = {
    fg = colors.grey,
  },
  right_sep = {
    str = "  ",
  },
  left_sep = {
    str = "  ",
  },
})

feline.setup({
  colors = {
    fg = colors.white,
    bg = colors.bg,
  },
  components = components,
  force_inactive = {
    filetypes = {
      "dashboard",
      "dbui",
      "esearch",
      "fugitive",
      "fugiviteblame",
      "NvimTree",
      "packer",
    },
    buftypes = {
      "terminal",
    },
    bufnames = {},
  },
})
