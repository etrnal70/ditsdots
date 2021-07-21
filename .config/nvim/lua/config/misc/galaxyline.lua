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
  bg = "#222222",
  white = "#FFFFFF",
  yellow = "#FABD2F",
  orange = "#FF8800",
  grey = "#bdbdbd",
  dark_grey = "#757575",
  blue = "#61AFEF",
  red = "#EC5F67",
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
    highlight = { colors.bg, colors.bg },
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
    highlight = { colors.bg, colors.bg },
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
    highlight = { colors.grey, colors.bg },
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

local function buffer_not_empty()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

local function wide_enough()
  local squeeze_width = vim.fn.winwidth(0)
  if squeeze_width > 80 then
    return true
  end
  return false
end

gls.right[2] = {
  CustomFileName = {
    provider = function()
      if not buffer_not_empty() then
        return ""
      end
      local fname
      if wide_enough() then
        fname = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
      else
        fname = vim.fn.expand("%:t")
      end
      if #fname == 0 then
        return ""
      end
      if vim.bo.readonly then
        fname = fname
      end
      if vim.bo.modified then
        fname = fname
      end
      return " " .. fname .. " "
    end,
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
    highlight = { colors.grey, colors.bg },
  },
}

gls.short_line_right[2] = {
  FileName = {
    provider = { "FileName" },
    highlight = { colors.grey, colors.bg },
  },
}
