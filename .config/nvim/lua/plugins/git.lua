return {
  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = function()
      require("gitsigns").setup {
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "┃" },
          topdelete = { text = "┃" },
          changedelete = { text = "┃" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]h", function()
            if vim.wo.diff then
              return "]h"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[h", function()
            if vim.wo.diff then
              return "[h"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map({ "n", "v" }, "<leader>hs", gs.stage_hunk)
          map({ "n", "v" }, "<leader>hr", gs.reset_hunk)
          map("n", "<leader>hS", gs.stage_buffer)
          map("n", "<leader>hu", gs.undo_stage_hunk)
          map("n", "<leader>hU", gs.reset_buffer_index)
          map("n", "<leader>hR", gs.reset_buffer)
          map("n", "<leader>hb", function()
            gs.blame_line { full = true }
          end)
          map("n", "<leader>hp", gs.preview_hunk_inline)
          map("n", "<leader>hP", gs.preview_hunk)
          map("n", "<leader>hd", gs.diffthis)
          map("n", "<leader>hD", function()
            gs.diffthis "~"
          end)

          -- Text Objects
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
        preview_config = {
          width = 40,
          height = 12,
          border = "solid",
        },
        current_line_blame = true,
        current_line_blame_formatter = "<author> • <author_time:%Y-%m-%d> - <summary>",
        current_line_blame_opts = {
          virt_text = false,
        },
        update_debounce = 500,
        _extmark_signs = true,
      }
    end,
  },
  {
    "NeogitOrg/neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit kind=tab<CR>" },
      { "<leader>gl", "<cmd>Neogit log<CR>" },
    },
    config = function()
      require("neogit").setup {
        graph_style = "unicode",
        disable_commit_confirmation = true,
        disable_builtin_notifications = true,
        kind = "tab",
      }
    end,
    dependencies = {
      {
        "sindrets/diffview.nvim",
        opts = { enhanced_diff_hl = true },
      },
    },
  },
  {
    "rhysd/git-messenger.vim",
    keys = "<leader>gm",
    init = function()
      vim.g.git_messenger_include_diff = "current"
      vim.g.git_messenger_close_on_cursor_moved = false
      vim.g.git_messenger_always_into_popup = true
      vim.g.git_messenger_max_popup_height = 20
      vim.g.git_messenger_max_popup_width = 50
      vim.g.git_messenger_floating_win_opts = { border = "solid" }
    end,
  },
  "rhysd/committia.vim",
  {
    "akinsho/git-conflict.nvim",
    event = "BufReadPre",
    opts = {
      default_mappings = true,
      disable_diagnostics = true,
    },
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    config = true,
  },
  -- "ThePrimeagen/git-worktree.nvim",
}
