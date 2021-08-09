require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = "<leader>o",
      },
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
        },
        autodetect = true,
        autochdir = true,
      },
    },
  },
})
