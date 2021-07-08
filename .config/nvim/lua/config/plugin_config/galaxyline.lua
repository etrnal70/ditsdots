-- #######################################
-- #####         Statusline          #####
-- #######################################
local gl = require("galaxyline")
local gls = gl.section
local condition = require("galaxyline.condition")
local ws_extension = require("lsp_extensions.workspace.diagnostic")
local fileinfo = require("galaxyline.provider_fileinfo")
local lsp_status = require("lsp-status")

gl.short_line_list = { "LuaTree", "dbui", "esearch" }

-- Define colors
local colors = {
  bg = nil,
  white = "#FFFFFF",
  yellow = "#FABD2F",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98C379",
  orange = "#FF8800",
  purple = "#5D4D7A",
  magenta = "#D16D9E",
  grey = "#C0C0C0",
  dark_grey = "#757575",
  very_dark_grey = "#2C2C2C",
  blue = "#61AFEF",
  red = "#EC5F67",
  black = "#000000",
}

-- Statusline positioning
gls.left[1] = {
  DiagnosticError = {
    provider = function()
      if next(vim.lsp.buf_get_clients(0)) == nil then
        return ""
      else
        return ws_extension.get_count(0, "Error")
      end
    end,
    icon = "  ",
    condition = function()
      if ws_extension.get_count(0, "Error") > 0 then
        return true
      else
        return false
      end
    end,
    highlight = { colors.red, colors.bg },
  },
}

gls.left[2] = {
  Space = {
    provider = function()
      return " "
    end,
  },
}

gls.left[3] = {
  DiagnosticWarn = {
    provider = function()
      if next(vim.lsp.buf_get_clients(0)) == nil then
        return ""
      else
        return ws_extension.get_count(0, "Hint")
      end
    end,
    icon = "  ",
    condition = function()
      if ws_extension.get_count(0, "Hint") > 0 then
        return true
      else
        return false
      end
    end,
    highlight = { colors.yellow, colors.bg },
  },
}

gls.left[4] = {
  Space = {
    provider = function()
      return " "
    end,
  },
}

gls.left[5] = {
  LspStatus = {
    provider = function()
      -- TODO: Improve handling
      local res = {}
      local config = {
        spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
      }

      local buf_message = lsp_status.messages()
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
    separator = "  ",
    separator_highlight = { colors.grey, colors.bg },
    highlight = { colors.dark_grey, colors.bg },
    condition = condition.check_active_lsp,
  },
}

gls.right[1] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = { fileinfo.get_file_icon_color, colors.bg },
  },
}

gls.right[2] = {
  FileName = {
    provider = { "FileName" },
    condition = condition.buffer_not_empty,
    highlight = { colors.white, colors.bg },
  },
}

gls.right[3] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = condition.check_git_workspace,
    highlight = { colors.orange, colors.bg },
  },
}

gls.right[4] = {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    highlight = { colors.grey, colors.bg },
  },
}

gls.right[5] = {
  LineInfo = {
    provider = "LineColumn",
    separator = "  ",
    separator_highlight = { colors.grey, colors.bg },
    highlight = { colors.dark_grey, colors.bg },
    condition = condition.buffer_not_empty,
  },
}

gls.short_line_right[1] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    highlight = { colors.very_dark_grey, colors.bg },
  },
}

gls.short_line_right[2] = {
  FileName = {
    provider = "FileName",
    highlight = { colors.very_dark_grey, colors.bg },
  },
}
