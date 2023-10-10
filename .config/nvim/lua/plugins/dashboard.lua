return {
  "nvimdev/dashboard-nvim",
  opts = {
    theme = "doom",
    hide = {
      statusline = true,
      tabline = true,
      winbar = true,
    },
    config = {
      header = {
        "                                        ",
        "         //                 /*          ",
        "      ,(/(//,               *###        ",
        "    ((((((////.             /####%*     ",
        " ,/(((((((/////*            /########   ",
        "/*///((((((//////.          *#########/ ",
        "//////((((((((((((/         *#########/.",
        "////////((((((((((((*       *#########/.",
        "/////////(/(((((((((((      *#########(.",
        "//////////.,((((((((((/(    *#########(.",
        "//////////.  /(((((((((((,  *#########(.",
        "(////////(.    (((((((((((( *#########(.",
        "(////////(.     ,#((((((((((##########(.",
        "((//////((.       /#((((((((##%%######(.",
        "((((((((((.         #(((((((####%%##%#(.",
        "((((((((((.          ,((((((#####%%%%%(.",
        " .#(((((((.            (((((#######%%   ",
        "    /(((((.             .(((#%##%%/*    ",
        "      ,(((.               /(#%%#        ",
        "        ./.                 #*          ",
        "                                        ",
        "                                        ",
        "                                        ",
        "                                        ",
        "                                        ",
      },
      center = {
        {
          icon = " ",
          icon_hl = "GitSignsAdd",
          desc = "New File",
          desc_hl = "Text",
          key = "e",
          key_hl = "GitSignsAdd",
          action = "enew",
        },
        {
          icon = "󰮗 ",
          icon_hl = "GitSignsAdd",
          desc = "Find File",
          desc_hl = "Text",
          key = "f",
          key_hl = "GitSignsAdd",
          action = "Telescope find_files",
        },
        {
          icon = " ",
          icon_hl = "GitSignsAdd",
          desc = "Find Text",
          desc_hl = "Text",
          key = "t",
          key_hl = "GitSignsAdd",
          action = "Telescope live_grep",
        },
        {
          icon = "󰗼 ",
          icon_hl = "GitSignsAdd",
          desc = "Quit",
          desc_hl = "Text",
          key = "q",
          key_hl = "GitSignsAdd",
          action = "qa",
        },
      },
      footer = {},
    },
  },
}
