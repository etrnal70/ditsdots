local feline = require("feline")
local providers = require("feline.providers")
local devicons = require("nvim-web-devicons")
local lsp = require("feline.providers.lsp")
local status = require("lsp-status")

local colors = {
  bg = "#222222",
  white = "#FFFFFF",
  yellow = "#FABD2F",
  orange = "#FF8800",
  grey = "#757575",
  dark_grey = "#444444",
  blue = "#61AFEF",
  red = "#EC5F67",
}

local ft_list = devicons.get_icons()

local properties = {
  force_inactive = {
    filetypes = {
      "NvimTree",
      "dbui",
      "esearch",
      "packer",
      "fugitive",
      "fugiviteblame",
    },
    buftypes = {
      "terminal",
    },
    bufnames = {},
  },
}

local components = {
  left = { active = {}, inactive = {} },
  mid = { active = {}, inactive = {} },
  right = { active = {}, inactive = {} },
}

-- Active Components
components.right.active[1] = {
  provider = function()
    local filename = vim.fn.expand("%:t")
    local extension = vim.fn.expand("%:e")
    local res = devicons.get_icon(filename, extension, { default = true })
    return res
  end,
  hl = function()
    local var = {}
    local ext = tostring(vim.fn.expand("%:e"))
    local res = ft_list[ext]
    if res ~= nil then
      var.fg = res.color
    else
      var.fg = "#6D8086"
    end
    return var
  end,
  icon = "",
}

components.right.active[2] = {
  provider = function()
    if (vim.fn.winwidth(0) / 2) < 60 then
      return vim.fn.pathshorten(vim.fn.fnamemodify(vim.fn.expand("%"), ":~:."))
    else
      return vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
    end
  end,
  hl = {
    fg = colors.white,
  },
  left_sep = {
    str = " ",
  },
  icon = "",
}

components.right.active[3] = {
  provider = "git_branch",
  hl = {
    fg = colors.orange,
  },
  icon = "  ",
}

components.right.active[4] = {
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
}

components.left.active[1] = {
  provider = "diagnostic_errors",
  enabled = function()
    return lsp.diagnostics_exist("Error")
  end,
  hl = {
    fg = colors.bg,
    bg = colors.red,
  },
  right_sep = {
    hl = {
      bg = colors.red,
    },
    str = " ",
  },
}

components.left.active[2] = {
  provider = "diagnostic_warnings",
  enabled = function()
    return lsp.diagnostics_exist("Warning")
  end,
  hl = {
    fg = colors.bg,
    bg = colors.yellow,
  },
  right_sep = {
    hl = {
      bg = colors.yellow,
    },
    str = " ",
  },
}

components.left.active[3] = {
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
}

-- Inactive Components
components.right.inactive[1] = {
  provider = function()
    if (vim.fn.winwidth(0) / 2) < 60 then
      return vim.fn.pathshorten(vim.fn.fnamemodify(vim.fn.expand("%"), ":~:."))
    else
      return vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
    end
  end,
  hl = {
    fg = colors.grey,
  },
  left_sep = {
    str = " ",
  },
}

components.right.inactive[2] = {
  provider = "git_branch",
  hl = {
    fg = colors.grey,
  },
  icon = "  ",
}

components.right.inactive[3] = {
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
}

components.left.inactive[1] = {
  provider = "diagnostic_errors",
  enabled = function()
    return lsp.diagnostics_exist("Error")
  end,
  hl = {
    fg = colors.dark_grey,
    bg = colors.grey,
  },
  right_sep = {
    hl = {
      bg = colors.grey,
    },
    str = " ",
  },
}

components.left.inactive[2] = {
  provider = "diagnostic_warnings",
  enabled = function()
    return lsp.diagnostics_exist("Warning")
  end,
  hl = {
    fg = colors.dark_grey,
    bg = colors.grey,
  },
  right_sep = {
    hl = {
      bg = colors.grey,
    },
    str = " ",
  },
}

components.left.inactive[3] = {
  provider = " ",
}

feline.setup({
  default_bg = colors.bg,
  default_fg = colors.white,
  components = components,
  properties = properties,
})
