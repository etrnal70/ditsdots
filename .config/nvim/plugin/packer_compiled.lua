-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/hanifrmdhn/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/hanifrmdhn/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/hanifrmdhn/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/hanifrmdhn/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hanifrmdhn/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["accelerated-jk.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/accelerated-jk.nvim",
    url = "https://github.com/rainbowhxch/accelerated-jk.nvim"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n\127\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\16show_guides\2\23highlight_on_hover\2\14min_width\3\25\26placement_editor_edge\2\nsetup\vaerial\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.misc.alpha\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["asyncrun.vim"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\27config.misc.asynctasks\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/asynctasks.vim",
    url = "https://github.com/skywind3000/asynctasks.vim"
  },
  ["clangd_extensions.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/clangd_extensions.nvim",
    url = "https://github.com/p00f/clangd_extensions.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-conventionalcommits"] = {
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-conventionalcommits",
    url = "https://github.com/davidsierradz/cmp-conventionalcommits"
  },
  ["cmp-emoji"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-emoji/after/plugin/cmp_emoji.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-git"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcmp_git\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-git",
    url = "https://github.com/petertriho/cmp-git"
  },
  ["cmp-latex-symbols"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols/after/plugin/cmp_latex.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-omni"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-omni/after/plugin/cmp_omni.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-omni",
    url = "https://github.com/hrsh7th/cmp-omni"
  },
  ["cmp-path"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-treesitter"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-treesitter/after/plugin/cmp_treesitter.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/committia.vim",
    url = "https://github.com/rhysd/committia.vim"
  },
  ["conflict-marker.vim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/conflict-marker.vim",
    url = "https://github.com/rhysd/conflict-marker.vim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config.misc.feline\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\vwindow\1\0\2\nblend\3\0\rrelative\veditor\ttext\1\0\1\fspinner\tdots\fsources\fnull-ls\1\0\0\1\0\1\vignore\2\bfmt\1\0\1\14max_width\3A\nalign\1\0\0\1\0\1\vbottom\1\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["flutter-tools.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim",
    url = "https://github.com/akinsho/flutter-tools.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["git-messenger.vim"] = {
    keys = { { "", "<leader>gm" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["git-worktree.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/git-worktree.nvim",
    url = "https://github.com/ThePrimeagen/git-worktree.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.git.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\no\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\18tag_transform\14snakecase\17dap_debug_vt\1\21dap_debug_keymap\1\nsetup\ago\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\1K\0\1\0\25config.misc.neo-tree\1\0\2\23other_win_hl_color\f#2F628E\25current_win_hl_color\f#6699CC\nsetup\18window-picker\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neogen = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\19snippet_engine\fluasnip\nsetup\vneogen\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/neogen",
    url = "https://github.com/danymat/neogen"
  },
  neotest = {
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/neotest",
    url = "https://github.com/rcarriga/neotest"
  },
  ["neotest-vim-test"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/neotest-vim-test",
    url = "https://github.com/rcarriga/neotest-vim-test"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.misc.null_ls\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-conventionalcommits", "cmp-emoji", "cmp-treesitter", "cmp-omni", "cmp-git", "cmp-buffer", "cmp_luasnip", "cmp-nvim-lsp", "cmp-latex-symbols", "cmp-path" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.completion\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nd\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\2\nnames\1\rRRGGBBAA\2\1\4\0\0\bcss\tdart\blua\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.dap\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\n}\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17virtual_text\1\0\1\fenabled\2\tsign\1\0\0\1\0\1\fenabled\1\nsetup\19nvim-lightbulb\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    commands = { "Luapad" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-luapad",
    url = "https://github.com/rafcamlet/nvim-luapad"
  },
  ["nvim-navic"] = {
    config = { "\27LJ\2\nZ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\14separator\n ❯ \14highlight\2\nsetup\15nvim-navic\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n�\4\0\1\v\0\29\2G6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\0026\2\0\0009\2\1\0029\2\3\2\18\4\1\0)\5\0\0)\6��+\a\1\0B\2\5\2:\2\1\2)\3-\0006\4\4\0009\4\5\4\21\6\2\0#\6\3\6B\4\2\2\22\4\0\0046\5\0\0009\5\6\0059\5\a\5'\a\b\0'\b\t\0'\t\n\0005\n\v\0=\1\f\nB\5\5\0016\5\0\0009\5\6\0059\5\a\5'\a\b\0'\b\r\0'\t\14\0005\n\15\0=\1\f\nB\5\5\0016\5\0\0009\5\16\0058\5\0\5+\6\2\0=\6\17\0056\5\0\0009\5\1\0059\5\18\5\18\a\0\0005\b\19\0=\3\20\b=\4\21\b6\t\0\0009\t\22\t9\t\23\t6\n\0\0009\n\22\n9\n\24\n!\t\n\t\23\t\1\t=\t\25\b6\t\0\0009\t\22\t9\t\26\t6\n\0\0009\n\16\n9\n\27\n!\t\n\t\23\t\1\t=\t\28\bB\5\3\1K\0\1\0\bcol\16numberwidth\fcolumns\brow\14cmdheight\nlines\6o\vheight\nwidth\1\0\3\vborder\nsolid\rrelative\veditor\vanchor\aSE\24nvim_win_set_config\twrap\awo\1\0\0\agk\6k\vbuffer\1\0\0\agj\6j\6n\bset\vkeymap\nfloor\tmath\23nvim_buf_get_lines\21nvim_win_get_buf\bapi\bvim\2\4�\1\1\0\4\0\a\0\0146\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0006\0\2\0'\2\1\0B\0\2\0029\0\3\0005\2\4\0003\3\5\0=\3\6\2B\0\2\1K\0\1\0\fon_open\0\1\0\4\vrender\fminimal\vstages\vstatic\18minimum_width\3-\22background_colour\16NormalFloat\nsetup\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-semantic-tokens"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\6\1\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0006\4\0\0'\6\4\0B\4\2\0?\4\0\0=\3\5\2B\0\2\1K\0\1\0\14highlight+nvim-semantic-tokens.table-highlighter\1\0\1\vpreset\fdefault\nsetup\25nvim-semantic-tokens\frequire\3����\4\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-semantic-tokens",
    url = "https://github.com/theHamsta/nvim-semantic-tokens"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-cmp", "nvim-ts-rainbow", "nvim-treesitter-context", "nvim-ts-context-commentstring", "nvim-trevJ.lua", "vim-matchup", "playground", "nvim-treesitter-textobjects", "neogen", "nvim-treesitter-textsubjects", "nvim-navic", "nvim-treesitter-refactor" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23treesitter-context\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-trevJ.lua"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-trevJ.lua",
    url = "https://github.com/AckslD/nvim-trevJ.lua"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["octo.nvim"] = {
    commands = { "Octo" },
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["persistence.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16persistence\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/persistence.nvim",
    url = "https://github.com/folke/persistence.nvim"
  },
  playground = {
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pretty-fold.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28config.misc.pretty-fold\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  ["rest.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14rest-nvim\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/rest.nvim",
    url = "https://github.com/NTBBloodbath/rest.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\nn\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vignore\1\0\0\rfiletype\1\0\0\1\2\0\0\rneo-tree\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["substrata.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/substrata.nvim",
    url = "https://github.com/kvrohit/substrata.nvim"
  },
  ["tabline-framework.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.misc.tabline\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/tabline-framework.nvim",
    url = "https://github.com/rafcamlet/tabline-framework.nvim"
  },
  ["telescope-asynctasks.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fmapping\27config.misc.asynctasks\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/telescope-asynctasks.nvim",
    url = "https://github.com/GustavoKatel/telescope-asynctasks.nvim"
  },
  ["telescope-bibtex.nvim"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/telescope-bibtex.nvim",
    url = "https://github.com/nvim-telescope/telescope-bibtex.nvim"
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-heading.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\1\vsilent\2%:Telescope heading theme=ivy<CR>\15<leader>lh\6n\bset\vkeymap\bvim\fheading\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/telescope-heading.nvim",
    url = "https://github.com/crispgm/telescope-heading.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-bibtex.nvim", "telescope-heading.nvim", "todo-comments.nvim", "telescope-asynctasks.nvim", "telescope-dap.nvim" },
    loaded = true,
    only_config = true
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\23:TodoTelescope<CR>\15<leader>lT\6n\bset\vkeymap\bvim\1\0\1\nsigns\1\nsetup\18todo-comments\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.misc.toggleterm\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["venn.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\a\0\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\4\0'\5\5\0B\3\2\0029\3\6\0034\4\0\0B\0\4\1K\0\1\0\16toggle_venn\21config.misc.venn\frequire\15VennToggle\29nvim_create_user_command\bapi\bvim\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/venn.nvim",
    url = "https://github.com/jbyuki/venn.nvim"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion/after/plugin/vim_dadbod_completion.lua", "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion/after/plugin/vim_dadbod_completion.vim" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion",
    url = "https://github.com/kristijanhusak/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    commands = { "DBUI" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-dotenv"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/vim-dotenv",
    url = "https://github.com/tpope/vim-dotenv"
  },
  ["vim-esearch"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-esearch",
    url = "https://github.com/eugen0329/vim-esearch"
  },
  ["vim-flog"] = {
    loaded = true,
    needs_bufread = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-flog",
    url = "https://github.com/rbong/vim-flog"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-matchup"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^trevj"] = "nvim-trevJ.lua"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: git-blame.nvim
time([[Setup for git-blame.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\27<author> • <summary>\30gitblame_message_template\"gitblame_display_virtual_text\6g\bvim\0", "setup", "git-blame.nvim")
time([[Setup for git-blame.nvim]], false)
time([[packadd for git-blame.nvim]], true)
vim.cmd [[packadd git-blame.nvim]]
time([[packadd for git-blame.nvim]], false)
-- Setup for: git-messenger.vim
time([[Setup for git-messenger.vim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\2\0\n\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0)\1\20\0=\1\6\0006\0\0\0009\0\1\0)\0012\0=\1\a\0006\0\0\0009\0\1\0005\1\t\0=\1\b\0K\0\1\0\1\0\1\vborder\nsolid$git_messenger_floating_win_opts\"git_messenger_max_popup_width#git_messenger_max_popup_height$git_messenger_always_into_popup(git_messenger_close_on_cursor_moved\fcurrent\31git_messenger_include_diff\6g\bvim\0", "setup", "git-messenger.vim")
time([[Setup for git-messenger.vim]], false)
-- Setup for: neotest
time([[Setup for neotest]], true)
try_loadstring("\27LJ\2\nt\0\0\a\0\6\1\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0?\4\0\0=\3\5\2B\0\2\1K\0\1\0\radapters\1\0\0\21neotest-vim-test\nsetup\fneotest\frequire\3����\4\0", "setup", "neotest")
time([[Setup for neotest]], false)
time([[packadd for neotest]], true)
vim.cmd [[packadd neotest]]
time([[packadd for neotest]], false)
-- Setup for: vim-dadbod-ui
time([[Setup for vim-dadbod-ui]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0K\0\1\0\14~/Queries\24db_ui_save_location\1\0\b\vtables\b\14collapsed\b›\fbuffers\a»\rexpanded\bᐯ\18connection_ok\b✓\14new_query\6+\21connection_error\b✕\16saved_query\b•\16db_ui_icons\rdb_async\6g\bvim\0", "setup", "vim-dadbod-ui")
time([[Setup for vim-dadbod-ui]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0004\1\0\0=\1\4\0K\0\1\0!matchup_matchparen_offscreen matchup_matchparen_deferred\27matchup_motion_enabled\6g\bvim\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
-- Setup for: vim-esearch
time([[Setup for vim-esearch]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\6\0\a6\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\1=\1\2\0K\0\1\0\17root_markers\1\b\0\0\t.git\rMakefile\17node_modules\15Cargo.toml\vgo.mod\fgo.work\16__pycache__\1\0\1\29win_update_throttle_wait\3�\1\fesearch\6g\bvim\0", "setup", "vim-esearch")
time([[Setup for vim-esearch]], false)
time([[packadd for vim-esearch]], true)
vim.cmd [[packadd vim-esearch]]
time([[packadd for vim-esearch]], false)
-- Setup for: nvim-trevJ.lua
time([[Setup for nvim-trevJ.lua]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\21format_at_cursor\ntrevj\frequireC\1\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0B\0\4\1K\0\1\0\0\14<leader>j\6n\bset\vkeymap\bvim\0", "setup", "nvim-trevJ.lua")
time([[Setup for nvim-trevJ.lua]], false)
-- Setup for: vim-flog
time([[Setup for vim-flog]], true)
try_loadstring("\27LJ\2\nH\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\14max_count\3�\31\27flog_default_arguments\6g\bvim\0", "setup", "vim-flog")
time([[Setup for vim-flog]], false)
time([[packadd for vim-flog]], true)
vim.cmd [[packadd vim-flog]]
time([[packadd for vim-flog]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: tabline-framework.nvim
time([[Config for tabline-framework.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.misc.tabline\frequire\0", "config", "tabline-framework.nvim")
time([[Config for tabline-framework.nvim]], false)
-- Config for: venn.nvim
time([[Config for venn.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\a\0\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\4\0'\5\5\0B\3\2\0029\3\6\0034\4\0\0B\0\4\1K\0\1\0\16toggle_venn\21config.misc.venn\frequire\15VennToggle\29nvim_create_user_command\bapi\bvim\0", "config", "venn.nvim")
time([[Config for venn.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.dap\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\vwindow\1\0\2\nblend\3\0\rrelative\veditor\ttext\1\0\1\fspinner\tdots\fsources\fnull-ls\1\0\0\1\0\1\vignore\2\bfmt\1\0\1\14max_width\3A\nalign\1\0\0\1\0\1\vbottom\1\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\1K\0\1\0\25config.misc.neo-tree\1\0\2\23other_win_hl_color\f#2F628E\25current_win_hl_color\f#6699CC\nsetup\18window-picker\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config.misc.feline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: nvim-semantic-tokens
time([[Config for nvim-semantic-tokens]], true)
try_loadstring("\27LJ\2\n�\1\0\0\a\0\6\1\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0006\4\0\0'\6\4\0B\4\2\0?\4\0\0=\3\5\2B\0\2\1K\0\1\0\14highlight+nvim-semantic-tokens.table-highlighter\1\0\1\vpreset\fdefault\nsetup\25nvim-semantic-tokens\frequire\3����\4\0", "config", "nvim-semantic-tokens")
time([[Config for nvim-semantic-tokens]], false)
-- Config for: persistence.nvim
time([[Config for persistence.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16persistence\frequire\0", "config", "persistence.nvim")
time([[Config for persistence.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.misc.toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nd\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\2\nnames\1\rRRGGBBAA\2\1\4\0\0\bcss\tdart\blua\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.misc.null_ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.git.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\n}\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17virtual_text\1\0\1\fenabled\2\tsign\1\0\0\1\0\1\fenabled\1\nsetup\19nvim-lightbulb\frequire\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: asyncrun.vim
time([[Config for asyncrun.vim]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\27config.misc.asynctasks\frequire\0", "config", "asyncrun.vim")
time([[Config for asyncrun.vim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n�\4\0\1\v\0\29\2G6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\0026\2\0\0009\2\1\0029\2\3\2\18\4\1\0)\5\0\0)\6��+\a\1\0B\2\5\2:\2\1\2)\3-\0006\4\4\0009\4\5\4\21\6\2\0#\6\3\6B\4\2\2\22\4\0\0046\5\0\0009\5\6\0059\5\a\5'\a\b\0'\b\t\0'\t\n\0005\n\v\0=\1\f\nB\5\5\0016\5\0\0009\5\6\0059\5\a\5'\a\b\0'\b\r\0'\t\14\0005\n\15\0=\1\f\nB\5\5\0016\5\0\0009\5\16\0058\5\0\5+\6\2\0=\6\17\0056\5\0\0009\5\1\0059\5\18\5\18\a\0\0005\b\19\0=\3\20\b=\4\21\b6\t\0\0009\t\22\t9\t\23\t6\n\0\0009\n\22\n9\n\24\n!\t\n\t\23\t\1\t=\t\25\b6\t\0\0009\t\22\t9\t\26\t6\n\0\0009\n\16\n9\n\27\n!\t\n\t\23\t\1\t=\t\28\bB\5\3\1K\0\1\0\bcol\16numberwidth\fcolumns\brow\14cmdheight\nlines\6o\vheight\nwidth\1\0\3\vborder\nsolid\rrelative\veditor\vanchor\aSE\24nvim_win_set_config\twrap\awo\1\0\0\agk\6k\vbuffer\1\0\0\agj\6j\6n\bset\vkeymap\nfloor\tmath\23nvim_buf_get_lines\21nvim_win_get_buf\bapi\bvim\2\4�\1\1\0\4\0\a\0\0146\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0006\0\2\0'\2\1\0B\0\2\0029\0\3\0005\2\4\0003\3\5\0=\3\6\2B\0\2\1K\0\1\0\fon_open\0\1\0\4\vrender\fminimal\vstages\vstatic\18minimum_width\3-\22background_colour\16NormalFloat\nsetup\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\nn\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vignore\1\0\0\rfiletype\1\0\0\1\2\0\0\rneo-tree\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.misc.alpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28config.misc.pretty-fold\frequire\0", "config", "pretty-fold.nvim")
time([[Config for pretty-fold.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\n\127\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\16show_guides\2\23highlight_on_hover\2\14min_width\3\25\26placement_editor_edge\2\nsetup\vaerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.misc.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.completion\frequire\0", "config", "nvim-cmp")

vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-git ]]

-- Config for: cmp-git
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcmp_git\frequire\0", "config", "cmp-git")

vim.cmd [[ packadd cmp-omni ]]
vim.cmd [[ packadd cmp-latex-symbols ]]
vim.cmd [[ packadd cmp-treesitter ]]
vim.cmd [[ packadd cmp-emoji ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd cmp-conventionalcommits ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd nvim-ts-context-commentstring ]]
vim.cmd [[ packadd playground ]]
vim.cmd [[ packadd nvim-ts-rainbow ]]
vim.cmd [[ packadd nvim-treesitter-context ]]

-- Config for: nvim-treesitter-context
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")

vim.cmd [[ packadd vim-matchup ]]
vim.cmd [[ packadd nvim-navic ]]

-- Config for: nvim-navic
try_loadstring("\27LJ\2\nZ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\14separator\n ❯ \14highlight\2\nsetup\15nvim-navic\frequire\0", "config", "nvim-navic")

vim.cmd [[ packadd nvim-treesitter-textsubjects ]]
vim.cmd [[ packadd nvim-treesitter-refactor ]]
vim.cmd [[ packadd neogen ]]

-- Config for: neogen
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\19snippet_engine\fluasnip\nsetup\vneogen\frequire\0", "config", "neogen")

vim.cmd [[ packadd telescope-dap.nvim ]]

-- Config for: telescope-dap.nvim
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0", "config", "telescope-dap.nvim")

vim.cmd [[ packadd telescope-asynctasks.nvim ]]

-- Config for: telescope-asynctasks.nvim
try_loadstring("\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fmapping\27config.misc.asynctasks\frequire\0", "config", "telescope-asynctasks.nvim")

vim.cmd [[ packadd todo-comments.nvim ]]

-- Config for: todo-comments.nvim
try_loadstring("\27LJ\2\n�\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\23:TodoTelescope<CR>\15<leader>lT\6n\bset\vkeymap\bvim\1\0\1\nsigns\1\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")

vim.cmd [[ packadd vim-dadbod ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Octo lua require("packer.load")({'octo.nvim'}, { cmd = "Octo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUI lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUI", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Luapad lua require("packer.load")({'nvim-luapad'}, { cmd = "Luapad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader>gm <cmd>lua require("packer.load")({'git-messenger.vim'}, { keys = "<lt>leader>gm", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType sql ++once lua require("packer.load")({'vim-dadbod-completion'}, { ft = "sql" }, _G.packer_plugins)]]
vim.cmd [[au FileType msql ++once lua require("packer.load")({'vim-dadbod-completion'}, { ft = "msql" }, _G.packer_plugins)]]
vim.cmd [[au FileType plsql ++once lua require("packer.load")({'vim-dadbod-completion'}, { ft = "plsql" }, _G.packer_plugins)]]
vim.cmd [[au FileType gomod ++once lua require("packer.load")({'go.nvim'}, { ft = "gomod" }, _G.packer_plugins)]]
vim.cmd [[au FileType gowork ++once lua require("packer.load")({'go.nvim'}, { ft = "gowork" }, _G.packer_plugins)]]
vim.cmd [[au FileType gohtmltmpl ++once lua require("packer.load")({'go.nvim'}, { ft = "gohtmltmpl" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'telescope-bibtex.nvim'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType bib ++once lua require("packer.load")({'telescope-bibtex.nvim'}, { ft = "bib" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType http ++once lua require("packer.load")({'rest.nvim'}, { ft = "http" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'telescope-heading.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], true)
vim.cmd [[source /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]]
time([[Sourcing ftdetect script at: /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], false)
time([[Sourcing ftdetect script at: /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/go.vim]], true)
vim.cmd [[source /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/go.vim]]
time([[Sourcing ftdetect script at: /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/go.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
