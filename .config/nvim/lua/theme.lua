local cmd = vim.api.nvim_command

-- #######################################
-- #####         Colorscheme         #####
-- #######################################
vim.o.termguicolors = true  -- Use GUI colors in terminal
vim.o.background = 'dark'   -- Set background to dark

vim.g.one_nvim_transparent_bg = true  -- Enable one-nvim transparency support
cmd('colorscheme one-nvim')

cmd('autocmd ColorScheme * highlight Normal guibg=NONE')    -- Make background transparent
cmd('autocmd ColorScheme * highlight NonText guibg=NONE')
cmd('autocmd ColorScheme * highlight SignColumn guibg=NONE')
cmd('autocmd ColorScheme * highlight StatusLine guibg=NONE')
cmd('autocmd ColorScheme * highlight StatusLineNC guibg=#2C2C2C')
cmd('autocmd ColorScheme * highlight VertSplit guifg=#3F3F3F guibg=NONE')
cmd('autocmd ColorScheme * highlight Pmenu guibg=#292927')

-- one-nvim specific fix
cmd('autocmd ColorScheme * highlight IncSearch guifg=NONE guibg=#D19A66')  -- highlight matching char when search

-- LSP Diagnostic color
cmd('autocmd ColorScheme * highlight LspDiagnosticsDefaultWarning guifg=#FCA903')
cmd('autocmd ColorScheme * highlight LspDiagnosticsDefaultError guifg=#E53935')
cmd('autocmd ColorScheme * highlight LspDiagnosticsDefaultHint guifg=LightGrey')
cmd('autocmd ColorScheme * highlight LspDiagnosticsDefaultInformation guifg=LightBlue')

cmd('autocmd ColorScheme * highlight CursorLineNr ctermbg=NONE ctermfg=White guibg=NONE guifg=White')
cmd('autocmd ColorScheme * highlight LineNr guifg=#3F3F3F')

-- #######################################
-- #####         Statusline          #####
-- #######################################
local gl = require('galaxyline')
local gls = gl.section
local whitespace = require('galaxyline.provider_whitespace')
local condition = require('galaxyline.condition')
local ws_extension = require('lsp_extensions.workspace.diagnostic')
local fileinfo = require('galaxyline.provider_fileinfo')
local lsp = require('galaxyline.provider_lsp')

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

gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {fileinfo.get_file_icon_color,colors.bg},
  },
}

gls.left[4] = {
  FileName = {
    provider = {'FileName'},
    condition = condition.buffer_not_empty,
    highlight = {colors.white,colors.bg}
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = condition.check_git_workspace,
    highlight = {colors.orange,colors.bg},
  }
}

gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.grey,colors.bg},
  }
}

-- LSP Name
gls.right[1] = {
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

gls.right[2] = {
  SemiBigSpace = {
    provider = function () return '   ' end
  }
}

gls.right[3] = {
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

gls.right[4] = {
  Space = {
    provider = function () return ' ' end
  }
}

gls.right[5] = {
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

gls.right[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = '  ',
    separator_highlight = {colors.grey,colors.bg},
    highlight = {colors.dark_grey,colors.bg},
    condition = condition.buffer_not_empty,
  },
}

gls.right[7] = {
  BigSpace = {
    provider = function () return '        ' end
  }
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
