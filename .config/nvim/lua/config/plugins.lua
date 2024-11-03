local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    { import = "plugins" },
    -- stdlib
    { "vhyrro/luarocks.nvim",  priority = 1000, config = true },
    { "nvim-lua/plenary.nvim", lazy = true },
    { "MunifTanjim/nui.nvim",  lazy = true },

    -- Completion
    {
      "hrsh7th/nvim-cmp",
      event = { "InsertEnter", "CmdlineEnter" },
      config = function()
        require "config.completion"
      end,
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {
          "saadparwaiz1/cmp_luasnip",
          dependencies = {
            {
              "L3MON4D3/LuaSnip",
              build = "make install_jsregexp",
            },
            "rafamadriz/friendly-snippets",
          },
        },
        {
          "petertriho/cmp-git",
          config = true,
        },
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-buffer",
        "davidsierradz/cmp-conventionalcommits",
        "kdheepak/cmp-latex-symbols",
        "lukas-reineke/cmp-under-comparator",
        "windwp/nvim-autopairs",
        "rcarriga/cmp-dap",
      },
    },

    -- Theme and Icons
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
      "sam4llis/nvim-tundra",
      lazy = false,
      priority = 1000,
      opts = {
        transparent_background = true,
        dim_inactive_windows = {
          enabled = true,
        },
        plugins = {
          lsp = true,
          treesitter = true,
          telescope = true,
          nvimtree = true,
          cmp = true,
          context = true,
          dbui = true,
          gitsigns = true,
          neogit = true,
        },
      },
    },

    -- Testing and Runner
    {
      "nvim-neotest/neotest",
      -- lazy = true,
      dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-neotest/neotest-go",
        "nvim-neotest/neotest-python",
        "rouge8/neotest-rust",
        "sidlatau/neotest-dart",
        "haydenmeade/neotest-jest",
        "marilari88/neotest-vitest",
      },
      -- init = function()
      --   vim.api.nvim_create_user_command("Neotest", "Lazy load neotest", {})
      -- end,
      config = function()
        require("config.misc.neotest").setup()
      end,
    },
    {
      "stevearc/overseer.nvim",
      keys = {
        { "<leader>ot", "<cmd>OverseerToggle!<CR>" },
        { "<leader>or", "<cmd>OverseerRun<CR>" },
        { "<leader>oR", "<cmd>OverseerRunLast<CR>" },
        { "<leader>ol", "<cmd>OverseerOpenLogLast<CR>" },
      },
      config = function()
        require("config.overseer").setup {
          dap = false,
        }
      end,
    },

    -- Misc
    {
      "rest-nvim/rest.nvim",
      ft = "http",
      dependencies = { "luarocks.nvim" },
      keys = {
        { "<leader>rr", "<Plug>RestNvim" },
        { "<leader>rp", "<Plug>RestNvimPreview" },
      },
      config = true,
    },
    {
      -- TODO Integrate with window-picker
      "willothy/flatten.nvim",
      opts = {
        window = { open = "alternate" },
      },
      lazy = false,
      priority = 1001,
    },
    {
      "chrisgrieser/nvim-early-retirement",
      config = true,
      event = "VeryLazy",
    },

    -- Lua development
    { "rafcamlet/nvim-luapad",       cmd = "Luapad" },
    { "paretje/nvim-man",            cmd = { "Man", "VMan" } },
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
  install = { colorscheme = { "tundra" } },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "logiPat",
        "matchit",
        "matchparen",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "rrhelper",
        "tar",
        "tarPlugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
      },
    },
  },
}
