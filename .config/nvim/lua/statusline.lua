local lsp = require('lsp-status')
local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','dbui'}

local colors = {
  bg = nil,
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98c379',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#61afef',
  red = '#ec5f67'
}

function table_to_string(tbl)
    local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..table_to_string(v)
        elseif type(v) == "boolean" then
            result = result..tostring(v)
        else
            result = result.."\""..v.."\""
        end
        result = result..","
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-1)
    end
    return result.."}"
end

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

gls.left[1] = {
  Space = {
    provider = function () return ' ' end
  }
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local mode_color = {n = colors.green, i = colors.blue, v=colors.orange, [''] = colors.green, V = colors.yellow,
      			  c = colors.red, no = colors.magenta,s = colors.orange,S=colors.orange,[''] = colors.orange,
			  ic = colors.yellow,R = colors.purple,Rv = colors.purple,cv = colors.red,ce=colors.red,[''] = colors.orange, 
			  r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,['!']  = colors.red,t = colors.red }
      vim.cmd('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      local alias = {n = 'NORMAL',i = 'INSERT',c= 'COMMAND',v = 'VISUAL', V= 'VISUAL', [''] = 'VISUAL'}
      return alias[vim.fn.mode()]
    end,
    separator = '  ',
    separator_highlight = {colors.yellow,function()
      if not buffer_not_empty() then
        return colors.bg
      end
      return colors.bg
    end},
    highlight = {colors.magenta,colors.bg,'bold'},
  },
}
gls.left[3] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.orange,colors.bg},
  }
}
gls.left[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.grey,colors.bg},
  }
}
gls.left[5] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}
gls.left[6] = {
  FileName = {
    provider = {'FileName'},
    condition = buffer_not_empty,
    separator = '',
    separator_highlight = {colors.bg,colors.bg},
    highlight = {colors.white,colors.bg}
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.right[1] = {
  LspMessage = {
    provider = function()
	local tbl = lsp.messages()
	local res = table_to_string(tbl)
	return res
    end,
    icon = '',
    highlight = {colors.grey,colors.bg}
  }
}
gls.right[2] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.right[3] = {
  Space = {
    provider = function () return ' ' end
  }
}
gls.right[4] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}
gls.right[5] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.grey,colors.bg},
    highlight = {colors.grey,colors.bg},
  },
}
gls.right[6] = {
  Space = {
    provider = function () return ' ' end
  }
}

gls.short_line_left[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = {colors.grey,colors.bg}
  }
}
