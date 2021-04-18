local cmd = vim.api.nvim_command

-- #######################################
-- #####         Colorscheme         #####
-- #######################################
vim.o.termguicolors = true  -- Use GUI colors in terminal
vim.o.background = 'dark'   -- Set background to dark

vim.g.one_nvim_transparent_bg = true  -- Enable one-nvim transparency support
cmd('syntax on')
vim.g.oceanic_next_terminal_bold = 1
vim.g.oceanic_next_terminal_italic = 1
cmd('colorscheme OceanicNext')

cmd('highlight Normal guibg=NONE ctermbg=NONE')    -- Make background transparent
cmd('highlight LineNr guibg=NONE ctermbg=NONE')
cmd('highlight SignColumn guibg=NONE ctermbg=NONE guifg=NONE ctermfg=NONE')
cmd('highlight EndOfBuffer guibg=NONE ctermbg=NONE')
cmd('highlight CursorLineNr ctermbg=NONE ctermfg=White guibg=NONE guifg=White')
cmd('highlight LineNr guifg=#3F3F3F')

cmd('highlight DiffAdd guibg=NONE ctermbg=NONE')
cmd('highlight DiffChange guibg=NONE ctermbg=NONE')
cmd('highlight DiffChangeDelete guibg=NONE ctermbg=NONE')
cmd('highlight DiffDelete guibg=NONE ctermbg=NONE')

cmd('highlight StatusLine guibg=NONE')
cmd('highlight StatusLineNC guibg=#2C2C2C')
cmd('highlight VertSplit gui=NONE guifg=NONE guibg=NONE')
cmd('highlight Pmenu guibg=#292927')

cmd('highlight DiffAdded guibg=#46A73B')
cmd('highlight DiffRemoved guibg=#E80C19')

-- #######################################
-- #####         Statusline          #####
-- #######################################
local gl              = require('galaxyline')
local gls             = gl.section
local whitespace      = require('galaxyline.provider_whitespace')
local condition       = require('galaxyline.condition')
local ws_extension    = require('lsp_extensions.workspace.diagnostic')
local fileinfo        = require('galaxyline.provider_fileinfo')
local lsp             = require('galaxyline.provider_lsp')
local lsp_status      = require('lsp-status')

gl.short_line_list = {'LuaTree','dbui','esearch'}

local aliases = {
  pyls_ms = 'MPLS',
  rust_analyzer = 'rust-analyzer',
  sumneko_lua = 'Sumneko-Lua'
}

-- Define colors
local colors = {
  bg = nil,
  white = '#FFFFFF',
  yellow = '#FABD2F',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98C379',
  orange = '#FF8800',
  purple = '#5D4D7A',
  magenta = '#D16D9E',
  grey = '#C0C0C0',
  dark_grey = '#757575',
  very_dark_grey = '#2C2C2C',
  blue = '#61AFEF',
  red = '#EC5F67',
  black = '#000000'
}

-- Statusline positioning
gls.left[1] = {
  Space = {
    provider = function () return ' ' end
  }
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local mode_color = {
        n = colors.green,
        i = colors.blue,
        v =colors.orange,
        [''] = colors.green,
        V = colors.yellow,
      	c = colors.red,
        no = colors.magenta,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
	ic = colors.yellow,
        R = colors.purple,
        Rv = colors.purple,
        cv = colors.red,
        ce = colors.red,
        [''] = colors.orange,
	r = colors.cyan,rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red
      }
      vim.cmd('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      local alias = {n = 'N',i = 'I',c= 'C',v = 'V', V= 'V', [''] = 'V'}
      return alias[vim.fn.mode()]
    end,
    separator = ' ',
    separator_highlight = {colors.yellow,function()
      if not condition.buffer_not_empty then
        return colors.bg
      end
      return colors.bg
    end},
    highlight = {colors.white,colors.bg,'bold'},
  },
}

-- LSP Name
gls.left[3] = {
  LspClient = {
    provider = function ()
      if next(vim.lsp.buf_get_clients(0)) == nil then
        return ''
      else
        local res = lsp.get_lsp_client()
        return aliases[res] or res
      end
    end,
    icon = '  ',
    condition = condition.check_active_lsp,
    highlight = {colors.white, colors.bg}
  }
}

gls.left[4] = {
  SemiBigSpace = {
    provider = function () return ' ' end
  }
}

gls.left[5] = {
  DiagnosticError = {
    provider = function()
      if next(vim.lsp.buf_get_clients(0)) == nil then
        return ''
      else
        return ws_extension.get_count(0,'Error')
      end
    end,
    icon = '  ',
    condition = function ()
      if ws_extension.get_count(0, 'Error') > 0 then
        return true
      else
        return false
      end
    end,
    highlight = {colors.red,colors.bg}
  }
}

gls.left[6] = {
  Space = {
    provider = function () return ' ' end
  }
}

gls.left[7] = {
  DiagnosticWarn = {
    provider = function()
      if next(vim.lsp.buf_get_clients(0)) == nil then
        return ''
      else
        return ws_extension.get_count(0,'Hint')
      end
    end,
    icon = '  ',
    condition = function ()
      if ws_extension.get_count(0, 'Hint') > 0 then
        return true
      else
        return false
      end
    end,
    highlight = {colors.yellow,colors.bg},
  }
}

gls.left[8] = {
  Space = {
    provider = function () return ' ' end
  }
}

gls.left[9] = {
  LspStatus = {
    provider = function()
      -- TODO: Improve handling
      local res = {}
      local config = {
        spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' }
      }

      local buf_message = lsp_status.messages()
      for _, msg in ipairs(buf_message) do
        local contents = ''
        if msg.progress then
          contents = msg.title
          if msg.message then 
            contents = contents
          end

          if msg.percentage then
            contents = contents
          end

          if msg.spinner then
            contents = contents .. ' ' .. config.spinner_frames[(msg.spinner % #config.spinner_frames) + 1] 
          end
        end

        table.insert(res, contents)
      end

      return vim.trim(table.concat(res, ' '))
    end,
    separator = '  ',
    separator_highlight = {colors.grey,colors.bg},
    highlight = {colors.dark_grey,colors.bg},
    condition = condition.check_active_lsp,
  },
}

gls.right[1] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {fileinfo.get_file_icon_color,colors.bg},
  },
}

gls.right[2] = {
  FileName = {
    provider = {'FileName'},
    condition = condition.buffer_not_empty,
    highlight = {colors.white,colors.bg}
  }
}

gls.right[3] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = condition.check_git_workspace,
    highlight = {colors.orange,colors.bg},
  }
}

gls.right[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.grey,colors.bg},
  }
}

gls.right[5] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = '  ',
    separator_highlight = {colors.grey,colors.bg},
    highlight = {colors.dark_grey,colors.bg},
    condition = condition.buffer_not_empty,
  },
}



gls.short_line_left[1] = {
  Space = {
    provider = function () return '  ' end
  }
}

gls.short_line_left[2] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = {colors.white, colors.very_dark_grey},
  }
}

gls.short_line_left[3] = {
  FileTypeName = {
    provider = 'FileTypeName',
    highlight = {colors.white, colors.very_dark_grey},
  }
}
