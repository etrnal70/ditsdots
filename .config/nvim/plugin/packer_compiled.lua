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
    config = { "\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vsticky\1\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.misc.alpha\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["asyncrun.vim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.misc.asynctasks\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/asynctasks.vim",
    url = "https://github.com/skywind3000/asynctasks.vim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.misc.bufferline\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
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
    after = { "nvim-lspconfig" },
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
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
  ["crates.nvim"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/crates.nvim/after/plugin/cmp_crates.lua" },
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/crates.nvim",
    url = "https://github.com/Saecki/crates.nvim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23config.misc.feline\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/famiu/feline.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\nã\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\2\rrelative\veditor\nblend\3\0\ttext\1\0\0\1\0\1\fspinner\18dots_negative\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["flog-forest"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/flog-forest",
    url = "https://github.com/TamaMcGlinn/flog-forest"
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
  ["git-messenger.vim"] = {
    config = { "\27LJ\2\n≈\2\0\0\2\0\n\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0)\1\20\0=\1\6\0006\0\0\0009\0\1\0)\0012\0=\1\a\0006\0\0\0009\0\1\0005\1\t\0=\1\b\0K\0\1\0\1\0\1\vborder\nsolid$git_messenger_floating_win_opts\"git_messenger_max_popup_width#git_messenger_max_popup_height$git_messenger_always_into_popup(git_messenger_close_on_cursor_moved\fcurrent\31git_messenger_include_diff\6g\bvim\0" },
    keys = { { "", "<leader>gm" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["git-worktree.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/git-worktree.nvim",
    url = "https://github.com/ThePrimeagen/git-worktree.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.git.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["litee-calltree.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/litee-calltree.nvim",
    url = "https://github.com/ldelossa/litee-calltree.nvim"
  },
  ["litee-symboltree.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/litee-symboltree.nvim",
    url = "https://github.com/ldelossa/litee-symboltree.nvim"
  },
  ["litee.nvim"] = {
    config = { "\27LJ\2\nÅ\2\0\0\4\0\r\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\0\0'\2\n\0B\0\2\0029\0\2\0005\2\v\0B\0\2\0016\0\0\0'\2\f\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\21litee.symboltree\1\0\1\fon_open\npanel\19litee.calltree\ttree\1\0\1\nicons\tnerd\npanel\1\0\2\16orientation\nright\15panel_size\3-\vnotify\1\0\0\1\0\1\fenabled\2\nsetup\14litee.lib\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/litee.nvim",
    url = "https://github.com/ldelossa/litee.nvim"
  },
  ["lsp_lines.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  neogen = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vneogen\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/neogen",
    url = "https://github.com/danymat/neogen"
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
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 config.completion.autopairs\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-git", "cmp-latex-symbols", "cmp-path", "cmp-nvim-lsp", "cmp-buffer", "cmp_luasnip" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.completion\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nY\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\2\nnames\1\rRRGGBBAA\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
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
  ["nvim-gps"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14separator\n ‚ùØ \nsetup\rnvim-gps\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
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
  ["nvim-metals"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-metals",
    url = "https://github.com/scalameta/nvim-metals"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n±\1\0\0\4\0\5\0\f6\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0006\0\2\0'\2\1\0B\0\2\0029\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\6\15max_height\3\3\14max_width\3A\22background_colour\f#000000\vstages\tfade\vrender\fminimal\18minimum_width\3#\nsetup\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26config.misc.nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-cmp", "nvim-treesitter-textobjects", "nvim-treesitter-refactor", "neogen", "playground", "nvim-ts-context-commentstring", "nvim-gps", "nvim-ts-rainbow" },
    loaded = true,
    only_config = true
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
  ["pomodoro.nvim"] = {
    config = { "\27LJ\2\nÿ\1\0\0\6\0\r\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\22:PomodoroStop<CR>\15<leader>PS\1\0\1\vsilent\2\23:PomodoroStart<CR>\15<leader>Ps\6n\bset\vkeymap\bvim\nsetup\rpomodoro\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/pomodoro.nvim",
    url = "https://github.com/wthollingsworth/pomodoro.nvim"
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
  ["sqls.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/sqls.nvim",
    url = "https://github.com/nanotee/sqls.nvim"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["substrata.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/substrata.nvim",
    url = "https://github.com/kvrohit/substrata.nvim"
  },
  ["telescope-asynctasks.nvim"] = {
    config = { "\27LJ\2\nÉ\1\0\0\a\0\n\0\r6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\0049\4\b\0049\4\t\4B\0\4\1K\0\1\0\ball\15asynctasks\15extensions\14telescope\frequire\15<leader>lt\6n\bset\vkeymap\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/telescope-asynctasks.nvim",
    url = "https://github.com/GustavoKatel/telescope-asynctasks.nvim"
  },
  ["telescope-bibtex.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
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
    config = { "\27LJ\2\nõ\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\27:Telescope heading<CR>\15<leader>lh\6n\bset\vkeymap\bvim\fheading\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/telescope-heading.nvim",
    url = "https://github.com/crispgm/telescope-heading.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-asynctasks.nvim", "telescope-bibtex.nvim", "telescope-dap.nvim", "telescope-heading.nvim", "todo-comments.nvim" },
    loaded = true,
    only_config = true
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\nî\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\23:TodoTelescope<CR>\15<leader>lT\6n\bset\vkeymap\bvim\1\0\1\nsigns\1\nsetup\18todo-comments\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["vim-boxdraw"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-boxdraw",
    url = "https://github.com/gyim/vim-boxdraw"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/kristijanhusak/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion/after/plugin/vim_dadbod_completion.lua", "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion/after/plugin/vim_dadbod_completion.vim" },
    config = { "\27LJ\2\n©\1\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0yautocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })\17nvim_command\bapi\bvim\0" },
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
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-ultest"] = {
    commands = { "Ultest", "UltestNearest", "UltestDebug", "UltestDebugNearest" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-ultest",
    url = "https://github.com/rcarriga/vim-ultest"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: vim-flog
time([[Setup for vim-flog]], true)
try_loadstring("\27LJ\2\ni\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0009let g:flog_default_arguments = { 'max_count': 2000 }\17nvim_command\bapi\bvim\0", "setup", "vim-flog")
time([[Setup for vim-flog]], false)
time([[packadd for vim-flog]], true)
vim.cmd [[packadd vim-flog]]
time([[packadd for vim-flog]], false)
-- Setup for: vim-dadbod-ui
time([[Setup for vim-dadbod-ui]], true)
try_loadstring("\27LJ\2\nΩ\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\0\b\16saved_query\b‚Ä¢\14collapsed\b‚Ä∫\18connection_ok\b‚úì\rexpanded\b·êØ\fbuffers\a¬ª\vtables\bÔÅ≥\21connection_error\b‚úï\14new_query\6+\16db_ui_icons\rdb_async\6g\bvim\0", "setup", "vim-dadbod-ui")
time([[Setup for vim-dadbod-ui]], false)
-- Setup for: vim-ultest
time([[Setup for vim-ultest]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16config.test\frequire\0", "setup", "vim-ultest")
time([[Setup for vim-ultest]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vsticky\1\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 config.completion.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.git.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.misc.alpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: asyncrun.vim
time([[Config for asyncrun.vim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.misc.asynctasks\frequire\0", "config", "asyncrun.vim")
time([[Config for asyncrun.vim]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nY\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\2\nnames\1\rRRGGBBAA\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: pomodoro.nvim
time([[Config for pomodoro.nvim]], true)
try_loadstring("\27LJ\2\nÿ\1\0\0\6\0\r\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\22:PomodoroStop<CR>\15<leader>PS\1\0\1\vsilent\2\23:PomodoroStart<CR>\15<leader>Ps\6n\bset\vkeymap\bvim\nsetup\rpomodoro\frequire\0", "config", "pomodoro.nvim")
time([[Config for pomodoro.nvim]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23config.misc.feline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26config.misc.nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28config.misc.pretty-fold\frequire\0", "config", "pretty-fold.nvim")
time([[Config for pretty-fold.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.misc.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n±\1\0\0\4\0\5\0\f6\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0006\0\2\0'\2\1\0B\0\2\0029\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\6\15max_height\3\3\14max_width\3A\22background_colour\f#000000\vstages\tfade\vrender\fminimal\18minimum_width\3#\nsetup\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: litee.nvim
time([[Config for litee.nvim]], true)
try_loadstring("\27LJ\2\nÅ\2\0\0\4\0\r\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\0\0'\2\n\0B\0\2\0029\0\2\0005\2\v\0B\0\2\0016\0\0\0'\2\f\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\21litee.symboltree\1\0\1\fon_open\npanel\19litee.calltree\ttree\1\0\1\nicons\tnerd\npanel\1\0\2\16orientation\nright\15panel_size\3-\vnotify\1\0\0\1\0\1\fenabled\2\nsetup\14litee.lib\frequire\0", "config", "litee.nvim")
time([[Config for litee.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.misc.null_ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.dap\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\nã\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\2\rrelative\veditor\nblend\3\0\ttext\1\0\0\1\0\1\fspinner\18dots_negative\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.misc.bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd vim-dadbod ]]
vim.cmd [[ packadd nvim-ts-context-commentstring ]]
vim.cmd [[ packadd playground ]]
vim.cmd [[ packadd nvim-ts-rainbow ]]
vim.cmd [[ packadd nvim-gps ]]

-- Config for: nvim-gps
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14separator\n ‚ùØ \nsetup\rnvim-gps\frequire\0", "config", "nvim-gps")

vim.cmd [[ packadd nvim-treesitter-refactor ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd neogen ]]

-- Config for: neogen
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vneogen\frequire\0", "config", "neogen")

vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.completion\frequire\0", "config", "nvim-cmp")

vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-latex-symbols ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd nvim-lspconfig ]]

-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0", "config", "nvim-lspconfig")

vim.cmd [[ packadd cmp-git ]]

-- Config for: cmp-git
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcmp_git\frequire\0", "config", "cmp-git")

vim.cmd [[ packadd todo-comments.nvim ]]

-- Config for: todo-comments.nvim
try_loadstring("\27LJ\2\nî\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\23:TodoTelescope<CR>\15<leader>lT\6n\bset\vkeymap\bvim\1\0\1\nsigns\1\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")

vim.cmd [[ packadd telescope-dap.nvim ]]

-- Config for: telescope-dap.nvim
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0", "config", "telescope-dap.nvim")

vim.cmd [[ packadd telescope-bibtex.nvim ]]
vim.cmd [[ packadd telescope-asynctasks.nvim ]]

-- Config for: telescope-asynctasks.nvim
try_loadstring("\27LJ\2\nÉ\1\0\0\a\0\n\0\r6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\0049\4\b\0049\4\t\4B\0\4\1K\0\1\0\ball\15asynctasks\15extensions\14telescope\frequire\15<leader>lt\6n\bset\vkeymap\bvim\0", "config", "telescope-asynctasks.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUI lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUI", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Octo lua require("packer.load")({'octo.nvim'}, { cmd = "Octo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ultest lua require("packer.load")({'vim-ultest'}, { cmd = "Ultest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UltestNearest lua require("packer.load")({'vim-ultest'}, { cmd = "UltestNearest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UltestDebug lua require("packer.load")({'vim-ultest'}, { cmd = "UltestDebug", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UltestDebugNearest lua require("packer.load")({'vim-ultest'}, { cmd = "UltestDebugNearest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
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
vim.cmd [[au FileType msql ++once lua require("packer.load")({'vim-dadbod-completion'}, { ft = "msql" }, _G.packer_plugins)]]
vim.cmd [[au FileType sql ++once lua require("packer.load")({'vim-dadbod-completion'}, { ft = "sql" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'telescope-heading.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType plsql ++once lua require("packer.load")({'vim-dadbod-completion'}, { ft = "plsql" }, _G.packer_plugins)]]
vim.cmd [[au FileType http ++once lua require("packer.load")({'rest.nvim'}, { ft = "http" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead Cargo.toml ++once lua require("packer.load")({'crates.nvim'}, { event = "BufRead Cargo.toml" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], true)
vim.cmd [[source /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]]
time([[Sourcing ftdetect script at: /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
