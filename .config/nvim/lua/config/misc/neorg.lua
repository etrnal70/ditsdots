require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.integrations.telescope"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = "<leader>o",
      },
    },
    ["core.norg.completion"] = {
      config = { engine = "nvim-cmp" }, -- We current support nvim-compe and nvim-cmp only
    },
    ["core.norg.concealer"] = {
      config = {
        icons = {
          heading = {
            level_1 = {
              icon = "◉",
            },
            level_2 = {
              icon = "◎",
            },
            level_3 = {
              icon = "○",
            },
            level_4 = {
              icon = "∙",
            },
          },
        },
      },
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          notes = "~/Data/Notes",
          uni = "~/Data/Coolyeah",
        },
        autodetect = true,
        autochdir = true,
      },
    },
  },
})
