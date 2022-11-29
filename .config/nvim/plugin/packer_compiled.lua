-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

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
  ["cmp-path"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-under-comparator"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
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
  ["document-color.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tmode\vsingle\nsetup\19document-color\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/document-color.nvim",
    url = "https://github.com/lvimuser/document-color.nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\nÂ\1\0\0\a\0\r\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\6\3=\3\b\0025\3\n\0005\4\t\0=\4\v\3=\3\f\2B\0\2\1K\0\1\0\vselect\fbackend\1\0\0\1\4\0\0\14telescope\fbuiltin\bnui\ninput\1\0\0\vborder\1\0\1\17winhighlight\23NormalFloat:Normal\23transparent_border\17config.utils\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config.misc.feline\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
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
  ["git-conflict.nvim"] = {
    config = { "\27LJ\2\nh\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\24disable_diagnostics\2\21default_mappings\1\nsetup\17git-conflict\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
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
  ["glance.nvim"] = {
    config = { "\27LJ\2\n4\0\4\a\0\0\1\v\21\4\0\0\t\4\0\0X\4\4Ä\18\4\2\0:\6\1\0B\4\2\1X\4\3Ä\18\4\1\0\18\6\0\0B\4\2\1K\0\1\0\2ñ\2\1\0\a\0\21\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\1\0B\1\2\0029\1\3\0015\3\r\0005\4\v\0005\5\5\0009\6\4\0=\6\6\0059\6\a\0=\6\b\0059\6\t\0=\6\n\5=\5\f\4=\4\14\0035\4\15\0=\4\16\0035\4\18\0003\5\17\0=\5\19\4=\4\20\3B\1\2\1K\0\1\0\nhooks\16before_open\1\0\0\0\nfolds\1\0\2\16fold_closed\bÔÅî\14fold_open\bÔÅ∏\rmappings\1\0\0\tlist\1\0\0\n<C-t>\rjump_tab\n<C-v>\16jump_vsplit\n<C-x>\1\0\0\15jump_split\nsetup\factions\vglance\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/glance.nvim",
    url = "https://github.com/DNLHC/glance.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\ní\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\20lsp_inlay_hints\1\0\3\18tag_transform\14snakecase\21dap_debug_keymap\1\17dap_debug_vt\1\1\0\1\venable\1\nsetup\ago\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["headlines.nvim"] = {
    config = { "\27LJ\2\nÜ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\rmarkdown\1\0\0\24headline_highlights\1\0\0\1\3\0\0\14Headline1\14Headline2\nsetup\14headlines\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/headlines.nvim",
    url = "https://github.com/lukas-reineke/headlines.nvim"
  },
  ["hlsearch.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rhlsearch\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/hlsearch.nvim",
    url = "https://github.com/glepnir/hlsearch.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-o-matic"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14max_lines\3à'\nsetup\19indent-o-matic\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/indent-o-matic",
    url = "https://github.com/Darazaki/indent-o-matic"
  },
  ["lsp-inlayhints.nvim"] = {
    config = { "\27LJ\2\nÀ\1\0\4\n\0\6\1!4\4\0\0\21\5\4\0\22\5\0\0059\6\0\1\15\0\6\0X\a\3Ä5\6\1\0\14\0\6\0X\a\1Ä+\6\0\0<\6\5\4\21\5\4\0\22\5\0\0054\6\3\0'\a\2\0\18\b\0\0'\t\2\0&\a\t\a>\a\1\0069\a\3\2>\a\2\6<\6\5\4\21\5\4\0\22\5\0\0059\6\4\1\15\0\6\0X\a\3Ä5\6\5\0\14\0\6\0X\a\1Ä+\6\0\0<\6\5\4L\4\2\0\1\3\0\0\6 \vNormal\17paddingRight\14highlight\6 \1\3\0\0\6 \vNormal\16paddingLeft\2w\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0003\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\16inlay_hints\1\0\0\24virt_text_formatter\1\0\0\0\nsetup\19lsp-inlayhints\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/lsp-inlayhints.nvim",
    url = "https://github.com/lvimuser/lsp-inlayhints.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nt\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\16hint_prefix\tÔ∞† \19always_trigger\2\20floating_window\1\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["messages.nvim"] = {
    config = { "\27LJ\2\nF\2\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0G\2\0\0A\0\0\1K\0\1\0\18capture_thing\17messages.api\frequireJ\1\0\3\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0003\1\5\0=\1\4\0K\0\1\0\0\bMap\a_G\nsetup\rmessages\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/messages.nvim",
    url = "https://github.com/AckslD/messages.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25config.misc.neo-tree\frequire\0" },
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
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.misc.neotest\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-dart"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/neotest-dart",
    url = "https://github.com/sidlatau/neotest-dart"
  },
  ["neotest-go"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/neotest-go",
    url = "https://github.com/nvim-neotest/neotest-go"
  },
  ["neotest-jest"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/neotest-jest",
    url = "https://github.com/haydenmeade/neotest-jest"
  },
  ["neotest-rust"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/neotest-rust",
    url = "https://github.com/rouge8/neotest-rust"
  },
  ["neotest-vitest"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/neotest-vitest",
    url = "https://github.com/marilari88/neotest-vitest"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.misc.noice\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["notifier.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rnotifier\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/notifier.nvim",
    url = "https://github.com/vigoux/notifier.nvim"
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
    after = { "cmp_luasnip", "cmp-conventionalcommits", "cmp-emoji", "cmp-git", "cmp-latex-symbols", "cmp-nvim-lsp", "cmp-path", "cmp-under-comparator", "cmp-buffer" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.completion\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nô\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\25user_default_options\1\0\2\nnames\1\tmode\16virtualtext\14filetypes\1\0\0\1\4\0\0\bcss\tdart\blua\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
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
    config = { "\27LJ\2\nZ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\14highlight\2\14separator\n ‚ùØ \nsetup\15nvim-navic\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-semantic-tokens"] = {
    config = { "\27LJ\2\n™\1\0\0\a\0\6\1\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0006\4\0\0'\6\4\0B\4\2\0?\4\0\0=\3\5\2B\0\2\1K\0\1\0\17highlighters+nvim-semantic-tokens.table-highlighter\1\0\1\vpreset\fdefault\nsetup\25nvim-semantic-tokens\frequire\3ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-semantic-tokens",
    url = "https://github.com/theHamsta/nvim-semantic-tokens"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\nc\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15highlights\1\0\0\1\0\1\rduration\3\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textsubjects", "nvim-ts-context-commentstring", "vim-matchup", "playground", "nvim-cmp", "nvim-treesitter-context", "nvim-treesitter-textobjects", "neogen", "nvim-treesitter-refactor", "nvim-navic", "nvim-ts-rainbow" },
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.misc.treesitter\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
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
  ["nvim-tundra"] = {
    config = { "\27LJ\2\nƒ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\fplugins\1\0\6\15treesitter\2\blsp\2\tdbui\2\fcontext\2\bcmp\2\14telescope\2\25dim_inactive_windows\1\0\1\fenabled\1\1\0\1\27transparent_background\2\nsetup\16nvim-tundra\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-tundra",
    url = "https://github.com/sam4llis/nvim-tundra"
  },
  ["nvim-ufo"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25config.misc.nvim-ufo\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
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
  ["overseer.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25config.misc.overseer\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/overseer.nvim",
    url = "https://github.com/stevearc/overseer.nvim"
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
  ["promise-async"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["rest.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14rest-nvim\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/rest.nvim",
    url = "https://github.com/rest-nvim/rest.nvim"
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
  ["ssr.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/ssr.nvim",
    url = "https://github.com/cshuaimin/ssr.nvim"
  },
  ["substrata.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/substrata.nvim",
    url = "https://github.com/kvrohit/substrata.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n–\1\0\0\6\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0006\3\0\0'\5\3\0B\3\2\0029\3\4\3=\3\6\2B\0\2\1K\0\1\0\vborder\1\0\5\nwidth\3#\24show_symbol_details\1\19relative_width\1\25preview_bg_highlight\rNormalNC\twrap\2\23transparent_border\17config.utils\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["tabline-framework.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.misc.tabline\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/tabline-framework.nvim",
    url = "https://github.com/rafcamlet/tabline-framework.nvim"
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
    config = { "\27LJ\2\n¥\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\1\vsilent\2%:Telescope heading theme=ivy<CR>\15<leader>lh\6n\bset\vkeymap\bvim\fheading\19load_extension\14telescope\frequire\0" },
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
    after = { "telescope-bibtex.nvim", "telescope-dap.nvim", "telescope-heading.nvim", "todo-comments.nvim" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.telescope\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["textobj-diagnostic.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23textobj-diagnostic\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/textobj-diagnostic.nvim",
    url = "https://github.com/andrewferrier/textobj-diagnostic.nvim"
  },
  ["tint.nvim"] = {
    config = { "\27LJ\2\nä\1\0\1\6\0\6\0\0176\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\0026\2\0\0009\2\1\0029\2\3\2\18\4\1\0'\5\4\0B\2\3\2\a\2\5\0X\3\2Ä+\3\2\0L\3\2\0+\3\1\0L\3\2\0\rneo-tree\rfiletype\24nvim_buf_get_option\21nvim_win_get_buf\bapi\bvim†\1\1\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0023\3\6\0=\3\a\2B\0\2\1K\0\1\0\27window_ignore_function\0\30highlight_ignore_patterns\1\3\0\0\17WinSeparator\rStatus.*\1\0\1\ttint\3Ïˇˇˇ\15\nsetup\ttint\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/tint.nvim",
    url = "https://github.com/levouh/tint.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\nî\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\23:TodoTelescope<CR>\15<leader>lT\6n\bset\vkeymap\bvim\1\0\1\nsigns\1\nsetup\18todo-comments\frequire\0" },
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
  ["typescript.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["venn.nvim"] = {
    config = { "\27LJ\2\nÑ\1\0\0\6\0\a\0\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\4\0'\5\5\0B\3\2\0029\3\6\0034\4\0\0B\0\4\1K\0\1\0\16toggle_venn\21config.misc.venn\frequire\15VennToggle\29nvim_create_user_command\bapi\bvim\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/venn.nvim",
    url = "https://github.com/jbyuki/venn.nvim"
  },
  ["vim-esearch"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-esearch",
    url = "https://github.com/eugen0329/vim-esearch"
  },
  ["vim-flog"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/vim-flog",
    url = "https://github.com/rbong/vim-flog"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\nú\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\23filetypes_denylist\1\0\1\22large_file_cutoff\3–Ü\3\1\5\0\0\14floggraph\rfugitive\fOutline\rneo-tree\14configure\15illuminate\frequire\0" },
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-matchup"] = {
    after_files = { "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["virtcolumn.nvim"] = {
    loaded = true,
    path = "/home/hanifrmdhn/.local/share/nvim/site/pack/packer/start/virtcolumn.nvim",
    url = "https://github.com/xiyaowong/virtcolumn.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^ssr"] = "ssr.nvim"
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

-- Setup for: git-messenger.vim
time([[Setup for git-messenger.vim]], true)
try_loadstring("\27LJ\2\n≈\2\0\0\2\0\n\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0)\1\20\0=\1\6\0006\0\0\0009\0\1\0)\0012\0=\1\a\0006\0\0\0009\0\1\0005\1\t\0=\1\b\0K\0\1\0\1\0\1\vborder\nsolid$git_messenger_floating_win_opts\"git_messenger_max_popup_width#git_messenger_max_popup_height$git_messenger_always_into_popup(git_messenger_close_on_cursor_moved\fcurrent\31git_messenger_include_diff\6g\bvim\0", "setup", "git-messenger.vim")
time([[Setup for git-messenger.vim]], false)
-- Setup for: ssr.nvim
time([[Setup for ssr.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\bssr\frequire\0", "setup", "ssr.nvim")
time([[Setup for ssr.nvim]], false)
-- Setup for: vim-esearch
time([[Setup for vim-esearch]], true)
try_loadstring("\27LJ\2\n¢\1\0\0\3\0\6\0\a6\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\1=\1\2\0K\0\1\0\17root_markers\1\b\0\0\t.git\rMakefile\17node_modules\15Cargo.toml\vgo.mod\fgo.work\16__pycache__\1\0\1\29win_update_throttle_wait\3˙\1\fesearch\6g\bvim\0", "setup", "vim-esearch")
time([[Setup for vim-esearch]], false)
time([[packadd for vim-esearch]], true)
vim.cmd [[packadd vim-esearch]]
time([[packadd for vim-esearch]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\2\në\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0004\1\0\0=\1\4\0K\0\1\0!matchup_matchparen_offscreen matchup_matchparen_deferred\27matchup_motion_enabled\6g\bvim\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.misc.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\nú\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\23filetypes_denylist\1\0\1\22large_file_cutoff\3–Ü\3\1\5\0\0\14floggraph\rfugitive\fOutline\rneo-tree\14configure\15illuminate\frequire\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n–\1\0\0\6\0\a\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0006\3\0\0'\5\3\0B\3\2\0029\3\4\3=\3\6\2B\0\2\1K\0\1\0\vborder\1\0\5\nwidth\3#\24show_symbol_details\1\19relative_width\1\25preview_bg_highlight\rNormalNC\twrap\2\23transparent_border\17config.utils\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: tabline-framework.nvim
time([[Config for tabline-framework.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.misc.tabline\frequire\0", "config", "tabline-framework.nvim")
time([[Config for tabline-framework.nvim]], false)
-- Config for: notifier.nvim
time([[Config for notifier.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rnotifier\frequire\0", "config", "notifier.nvim")
time([[Config for notifier.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\n}\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17virtual_text\1\0\1\fenabled\2\tsign\1\0\0\1\0\1\fenabled\1\nsetup\19nvim-lightbulb\frequire\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: document-color.nvim
time([[Config for document-color.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tmode\vsingle\nsetup\19document-color\frequire\0", "config", "document-color.nvim")
time([[Config for document-color.nvim]], false)
-- Config for: glance.nvim
time([[Config for glance.nvim]], true)
try_loadstring("\27LJ\2\n4\0\4\a\0\0\1\v\21\4\0\0\t\4\0\0X\4\4Ä\18\4\2\0:\6\1\0B\4\2\1X\4\3Ä\18\4\1\0\18\6\0\0B\4\2\1K\0\1\0\2ñ\2\1\0\a\0\21\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\1\0B\1\2\0029\1\3\0015\3\r\0005\4\v\0005\5\5\0009\6\4\0=\6\6\0059\6\a\0=\6\b\0059\6\t\0=\6\n\5=\5\f\4=\4\14\0035\4\15\0=\4\16\0035\4\18\0003\5\17\0=\5\19\4=\4\20\3B\1\2\1K\0\1\0\nhooks\16before_open\1\0\0\0\nfolds\1\0\2\16fold_closed\bÔÅî\14fold_open\bÔÅ∏\rmappings\1\0\0\tlist\1\0\0\n<C-t>\rjump_tab\n<C-v>\16jump_vsplit\n<C-x>\1\0\0\15jump_split\nsetup\factions\vglance\frequire\0", "config", "glance.nvim")
time([[Config for glance.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.misc.null_ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config.misc.feline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: headlines.nvim
time([[Config for headlines.nvim]], true)
try_loadstring("\27LJ\2\nÜ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\rmarkdown\1\0\0\24headline_highlights\1\0\0\1\3\0\0\14Headline1\14Headline2\nsetup\14headlines\frequire\0", "config", "headlines.nvim")
time([[Config for headlines.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nô\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\25user_default_options\1\0\2\nnames\1\tmode\16virtualtext\14filetypes\1\0\0\1\4\0\0\bcss\tdart\blua\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: textobj-diagnostic.nvim
time([[Config for textobj-diagnostic.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23textobj-diagnostic\frequire\0", "config", "textobj-diagnostic.nvim")
time([[Config for textobj-diagnostic.nvim]], false)
-- Config for: lsp-inlayhints.nvim
time([[Config for lsp-inlayhints.nvim]], true)
try_loadstring("\27LJ\2\nÀ\1\0\4\n\0\6\1!4\4\0\0\21\5\4\0\22\5\0\0059\6\0\1\15\0\6\0X\a\3Ä5\6\1\0\14\0\6\0X\a\1Ä+\6\0\0<\6\5\4\21\5\4\0\22\5\0\0054\6\3\0'\a\2\0\18\b\0\0'\t\2\0&\a\t\a>\a\1\0069\a\3\2>\a\2\6<\6\5\4\21\5\4\0\22\5\0\0059\6\4\1\15\0\6\0X\a\3Ä5\6\5\0\14\0\6\0X\a\1Ä+\6\0\0<\6\5\4L\4\2\0\1\3\0\0\6 \vNormal\17paddingRight\14highlight\6 \1\3\0\0\6 \vNormal\16paddingLeft\2w\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0003\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\16inlay_hints\1\0\0\24virt_text_formatter\1\0\0\0\nsetup\19lsp-inlayhints\frequire\0", "config", "lsp-inlayhints.nvim")
time([[Config for lsp-inlayhints.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.git.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
try_loadstring("\27LJ\2\nh\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\24disable_diagnostics\2\21default_mappings\1\nsetup\17git-conflict\frequire\0", "config", "git-conflict.nvim")
time([[Config for git-conflict.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.misc.alpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-tundra
time([[Config for nvim-tundra]], true)
try_loadstring("\27LJ\2\nƒ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\fplugins\1\0\6\15treesitter\2\blsp\2\tdbui\2\fcontext\2\bcmp\2\14telescope\2\25dim_inactive_windows\1\0\1\fenabled\1\1\0\1\27transparent_background\2\nsetup\16nvim-tundra\frequire\0", "config", "nvim-tundra")
time([[Config for nvim-tundra]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\nÂ\1\0\0\a\0\r\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\6\3=\3\b\0025\3\n\0005\4\t\0=\4\v\3=\3\f\2B\0\2\1K\0\1\0\vselect\fbackend\1\0\0\1\4\0\0\14telescope\fbuiltin\bnui\ninput\1\0\0\vborder\1\0\1\17winhighlight\23NormalFloat:Normal\23transparent_border\17config.utils\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: tint.nvim
time([[Config for tint.nvim]], true)
try_loadstring("\27LJ\2\nä\1\0\1\6\0\6\0\0176\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\0026\2\0\0009\2\1\0029\2\3\2\18\4\1\0'\5\4\0B\2\3\2\a\2\5\0X\3\2Ä+\3\2\0L\3\2\0+\3\1\0L\3\2\0\rneo-tree\rfiletype\24nvim_buf_get_option\21nvim_win_get_buf\bapi\bvim†\1\1\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0023\3\6\0=\3\a\2B\0\2\1K\0\1\0\27window_ignore_function\0\30highlight_ignore_patterns\1\3\0\0\17WinSeparator\rStatus.*\1\0\1\ttint\3Ïˇˇˇ\15\nsetup\ttint\frequire\0", "config", "tint.nvim")
time([[Config for tint.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.dap\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: nvim-semantic-tokens
time([[Config for nvim-semantic-tokens]], true)
try_loadstring("\27LJ\2\n™\1\0\0\a\0\6\1\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\3\0006\4\0\0'\6\4\0B\4\2\0?\4\0\0=\3\5\2B\0\2\1K\0\1\0\17highlighters+nvim-semantic-tokens.table-highlighter\1\0\1\vpreset\fdefault\nsetup\25nvim-semantic-tokens\frequire\3ÄÄ¿ô\4\0", "config", "nvim-semantic-tokens")
time([[Config for nvim-semantic-tokens]], false)
-- Config for: persistence.nvim
time([[Config for persistence.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16persistence\frequire\0", "config", "persistence.nvim")
time([[Config for persistence.nvim]], false)
-- Config for: indent-o-matic
time([[Config for indent-o-matic]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14max_lines\3à'\nsetup\19indent-o-matic\frequire\0", "config", "indent-o-matic")
time([[Config for indent-o-matic]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24config.misc.neotest\frequire\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.misc.noice\frequire\0", "config", "noice.nvim")
time([[Config for noice.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27config.misc.toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\nt\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\16hint_prefix\tÔ∞† \19always_trigger\2\20floating_window\1\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25config.misc.nvim-ufo\frequire\0", "config", "nvim-ufo")
time([[Config for nvim-ufo]], false)
-- Config for: messages.nvim
time([[Config for messages.nvim]], true)
try_loadstring("\27LJ\2\nF\2\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0G\2\0\0A\0\0\1K\0\1\0\18capture_thing\17messages.api\frequireJ\1\0\3\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0003\1\5\0=\1\4\0K\0\1\0\0\bMap\a_G\nsetup\rmessages\frequire\0", "config", "messages.nvim")
time([[Config for messages.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\nc\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15highlights\1\0\0\1\0\1\rduration\3\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: overseer.nvim
time([[Config for overseer.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25config.misc.overseer\frequire\0", "config", "overseer.nvim")
time([[Config for overseer.nvim]], false)
-- Config for: venn.nvim
time([[Config for venn.nvim]], true)
try_loadstring("\27LJ\2\nÑ\1\0\0\6\0\a\0\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\4\0'\5\5\0B\3\2\0029\3\6\0034\4\0\0B\0\4\1K\0\1\0\16toggle_venn\21config.misc.venn\frequire\15VennToggle\29nvim_create_user_command\bapi\bvim\0", "config", "venn.nvim")
time([[Config for venn.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25config.misc.neo-tree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter-textsubjects ]]
vim.cmd [[ packadd nvim-navic ]]

-- Config for: nvim-navic
try_loadstring("\27LJ\2\nZ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\14highlight\2\14separator\n ‚ùØ \nsetup\15nvim-navic\frequire\0", "config", "nvim-navic")

vim.cmd [[ packadd nvim-treesitter-refactor ]]
vim.cmd [[ packadd neogen ]]

-- Config for: neogen
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\19snippet_engine\fluasnip\nsetup\vneogen\frequire\0", "config", "neogen")

vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.completion\frequire\0", "config", "nvim-cmp")

vim.cmd [[ packadd cmp-emoji ]]
vim.cmd [[ packadd cmp-conventionalcommits ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd cmp-git ]]

-- Config for: cmp-git
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcmp_git\frequire\0", "config", "cmp-git")

vim.cmd [[ packadd cmp-under-comparator ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-latex-symbols ]]
vim.cmd [[ packadd playground ]]
vim.cmd [[ packadd vim-matchup ]]
vim.cmd [[ packadd nvim-treesitter-context ]]

-- Config for: nvim-treesitter-context
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")

vim.cmd [[ packadd nvim-ts-context-commentstring ]]
vim.cmd [[ packadd nvim-ts-rainbow ]]
vim.cmd [[ packadd todo-comments.nvim ]]

-- Config for: todo-comments.nvim
try_loadstring("\27LJ\2\nî\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\23:TodoTelescope<CR>\15<leader>lT\6n\bset\vkeymap\bvim\1\0\1\nsigns\1\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")

vim.cmd [[ packadd telescope-dap.nvim ]]

-- Config for: telescope-dap.nvim
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0", "config", "telescope-dap.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Octo lua require("packer.load")({'octo.nvim'}, { cmd = "Octo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
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
vim.cmd [[au FileType gowork ++once lua require("packer.load")({'go.nvim'}, { ft = "gowork" }, _G.packer_plugins)]]
vim.cmd [[au FileType gohtmltmpl ++once lua require("packer.load")({'go.nvim'}, { ft = "gohtmltmpl" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'telescope-heading.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType http ++once lua require("packer.load")({'rest.nvim'}, { ft = "http" }, _G.packer_plugins)]]
vim.cmd [[au FileType bib ++once lua require("packer.load")({'telescope-bibtex.nvim'}, { ft = "bib" }, _G.packer_plugins)]]
vim.cmd [[au FileType gomod ++once lua require("packer.load")({'go.nvim'}, { ft = "gomod" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'telescope-bibtex.nvim'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'hlsearch.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/go.vim]], true)
vim.cmd [[source /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/go.vim]]
time([[Sourcing ftdetect script at: /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/go.vim]], false)
time([[Sourcing ftdetect script at: /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/gomod.vim]], true)
vim.cmd [[source /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/gomod.vim]]
time([[Sourcing ftdetect script at: /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/gomod.vim]], false)
time([[Sourcing ftdetect script at: /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], true)
vim.cmd [[source /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]]
time([[Sourcing ftdetect script at: /home/hanifrmdhn/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
