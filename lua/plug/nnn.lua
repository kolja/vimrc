
local exit_nnn = function() return {} end
require('nnn').setup({
    command = "NNN_OPTS=\"\" nnn -R",
    set_default_mappings = false,
    statusline = false,
    picker = {
        style = {
            border = 'single' -- single
        }
    },
    layout = { 
        window = {
            width = 0.8, 
            height = 0.6,
            -- highlight = 'Debug'
        }
    },
    action = {'<esc>', exit_nnn}
})
