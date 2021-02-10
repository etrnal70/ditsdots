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
cmd('autocmd ColorScheme * highlight VertSplit guifg=#3F3F3F guibg=NONE')
cmd('autocmd ColorScheme * highlight Pmenu guibg=#292927')

-- one-nvim specific fix
cmd('autocmd ColorScheme * highlight IncSearch guifg=NONE guibg=#D19A66')  -- highlight matching char when search

-- LSP Diagnostic color
cmd('autocmd ColorScheme * highlight LspDiagnosticsDefaultWarning guifg=#fca903')
cmd('autocmd ColorScheme * highlight LspDiagnosticsDefaultError guifg=#e53935')
cmd('autocmd ColorScheme * highlight LspDiagnosticsDefaultHint guifg=LightGrey')
cmd('autocmd ColorScheme * highlight LspDiagnosticsDefaultInformation guifg=LightBlue')

-- Gitsigns color
cmd('autocmd ColorScheme * highlight DiffAdd cterm=NONE gui=NONE ctermbg=NONE guibg=NONE')
cmd('autocmd ColorScheme * highlight DiffChange cterm=NONE gui=NONE ctermbg=NONE guibg=NONE')
cmd('autocmd ColorScheme * highlight DiffDelete cterm=NONE gui=NONE ctermbg=NONE guibg=NONE')

cmd('autocmd ColorScheme * highlight CursorLineNr ctermbg=NONE ctermfg=White guibg=NONE guifg=White')
cmd('autocmd ColorScheme * highlight LineNr guifg=#323232')

-- #######################################
-- #####         Statusline          #####
-- #######################################
local gl = require('galaxyline')
local gls = gl.section
local status = require('lsp_status')
gl.short_line_list = {'LuaTree','dbui'}

-- Define colors
local colors = {
  bg = nil,
  yellow = '#FABD2F',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98C379',
  orange = '#FF8800',
  purple = '#5D4D7A',
  magenta = '#D16D9E',
  grey = '#C0C0C0',
  dark_grey = '#757575',
  blue = '#61AFEF',
  red = '#EC5F67',
  black = '#000000'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

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
      local alias = {n = 'NORMAL',i = 'INSERT',c= 'COMMAND',v = 'VISUAL', V= 'VISUAL', [''] = 'VISUAL'}
      return alias[vim.fn.mode()]
    end,
    separator = ' ',
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
    provider = function() return ' ' end,
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

gls.left[5] = {
  Space = {
    provider = function () return ' ' end
  }
}

gls.left[6] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}

gls.left[7] = {
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

-- LSP Status (WIP)
gls.right[1] = {
  Space = {
    provider = function () return ' ' end
  }
  -- LspMessage = {
  --   provider = status.update_text(),
  --   icon = '',
  --   highlight = {colors.grey,colors.bg}
  -- }
}

gls.right[2] = {
  Space = {
    provider = function () return ' ' end
  }
}

gls.right[3] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = ' ',
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
    provider = 'DiagnosticWarn',
    icon = ' ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.right[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = '  ',
    separator_highlight = {colors.grey,colors.bg},
    highlight = {colors.dark_grey,colors.bg},
  },
}
gls.right[7] = {
  BigSpace = {
    provider = function () return '        ' end
  }
}

gls.short_line_left[1] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {colors.grey,colors.bg}
  },
}

gls.short_line_left[2] = {
  FileName = {
    provider = {'FileName'},
    condition = buffer_not_empty,
    separator = '',
    separator_highlight = {colors.bg,colors.bg},
    highlight = {colors.white,colors.bg}
  }
}
