return {
  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┃" },
      },
      preview_config = {
        width = 40,
        height = 12,
        border = "solid",
      },
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_formatter = "<author> • <author_time:%Y-%m-%d> - <summary>",
      current_line_blame_opts = {
        virt_text = false,
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
    },
  },
  {
    "NeogitOrg/neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit kind=tab<CR>" },
      { "<leader>gl", "<cmd>Neogit log<CR>" },
    },
    opts = {
      graph_style = "unicode",
      disable_commit_confirmation = true,
      disable_builtin_notifications = true,
      kind = "tab",
      process_spinner = false,
    },
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
    "daliusd/ghlite.nvim",
    config = function()
      require("ghlite").setup {
        keys = {
          { "<leader>us", ":GHLitePRSelect<cr>",        silent = true },
          { "<leader>uo", ":GHLitePRCheckout<cr>",      silent = true },
          { "<leader>uv", ":GHLitePRView<cr>",          silent = true },
          { "<leader>uu", ":GHLitePRLoadComments<cr>",  silent = true },
          { "<leader>up", ":GHLitePRDiff<cr>",          silent = true },
          { "<leader>ul", ":GHLitePRDiffview<cr>",      silent = true },
          { "<leader>ua", ":GHLitePRAddComment<cr>",    silent = true },
          { "<leader>ua", ":GHLitePRAddComment<cr>",    mode = "v",   silent = true },
          { "<leader>uc", ":GHLitePRUpdateComment<cr>", silent = true },
          { "<leader>ud", ":GHLitePRDeleteComment<cr>", silent = true },
          { "<leader>ug", ":GHLitePROpenComment<cr>",   silent = true },
        },
      }
    end,
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    config = true,
  },
}
