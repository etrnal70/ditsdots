local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
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
}

dashboard.section.buttons.val = {
  dashboard.button("r", "神 Restore Session", ":lua require'persistence'.load()<CR>"),
  dashboard.button("e", "  New File    ", ":enew<CR>"),
  dashboard.button("f", "  Find File   ", ":Telescope find_files<CR>"),
  dashboard.button("t", "  Find Text   ", ":Telescope live_grep<CR>"),
  dashboard.button("q", "ﴚ  Quit        ", ":qa<CR>"),
}

dashboard.section.footer.val = {
  "                           ",
  "                           ",
  "Modal editing go brrrrr....",
  "                           ",
  "                           ",
}

alpha.setup(dashboard.opts)
