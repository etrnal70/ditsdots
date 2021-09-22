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
      config = { engine = "nvim-cmp" },
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
          default = "~/Data",
          notes = "~/Data/Notes",
          uni = "~/Data/Uni",
        },
        autodetect = true,
        autochdir = true,
      },
    },
  },
})
