-- #####################################
-- #####      dashboard.nvim       #####
-- #####################################
-- ASCII art taken from http://ctrl-c.club/~lovetocode999/ascii-art.html
vim.g.dashboard_custom_header = {
'                                        ',
'                                        ',
'                                        ',
'                                        ',
'         //                 /*          ',
'      ,(/(//,               *###        ',
'    ((((((////.             /####%*     ',
' ,/(((((((/////*            /########   ',
'/*///((((((//////.          *#########/ ',
'//////((((((((((((/         *#########/.',
'////////((((((((((((*       *#########/.',
'/////////(/(((((((((((      *#########(.',
'//////////.,((((((((((/(    *#########(.',
'//////////.  /(((((((((((,  *#########(.',
'(////////(.    (((((((((((( *#########(.',
'(////////(.     ,#((((((((((##########(.',
'((//////((.       /#((((((((##%%######(.',
'((((((((((.         #(((((((####%%##%#(.',
'((((((((((.          ,((((((#####%%%%%(.',
' .#(((((((.            (((((#######%%   ',
'    /(((((.             .(((#%##%%/*    ',
'      ,(((.               /(#%%#        ',
'        ./.                 #*          ',
'                                        ',
'                                        ',
}

vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
    a = {description = {'  New File       '}, command = 'enew'},
    b = {description = {'  Find File      '}, command = 'Telescope find_files'},
    c = {description = {'  Find Text      '}, command = 'Telescope live_grep'},
    d = {description = {'  Find Session   '}, command = 'Telescope session-lens search_session'},
    e = {description = {'ﴚ  Quit           '}, command = 'qa'},
}
vim.g.dashboard_custom_footer = {'Modal editing go brrrrr....'}
