
local theme = require'lualine.themes.OceanicNext'
-- local theme = require'lualine.themes.iceberg_dark'

require('lualine').setup {
    options = { 
        theme  = theme,
        section_separators = '',
        component_separators = '',
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            {
                'mode',
                fmt = function (str) return str:sub(1,1) end,
            }
        },
        lualine_b = {'filename'},
        lualine_c = {'branch'},
        lualine_d = {
            {'diagnostics', 
                sources = {'nvim_lsp'}
            }
        },
        lualine_x = {
            -- 'encoding', 
            -- 'fileformat', 
            'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}
