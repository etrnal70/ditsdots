-- #####################################
-- #####        Kommentary         #####
-- #####################################
-- Comment line/range using gc
local kommentary = require('kommentary.config')

kommentary.configure_language(
  "default",{
    prefer_multi_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true
  }
)

kommentary.configure_language(
  "lua",{
    prefer_single_line_comments = true,
    single_line_comment_string = "--",
    multi_line_comment_string = {"--[[", "]]"}
  }
)
