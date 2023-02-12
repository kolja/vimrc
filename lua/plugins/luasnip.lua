
return {
    'L3MON4D3/LuaSnip',
    dependencies = {'rafamadriz/friendly-snippets'},
    config = function ()
        local ls = require('luasnip')
        local types = require('luasnip.util.types')
        -- local vscode_loader = require("luasnip.loaders.from_vscode")
        ls.config.set_config {
            history = true,
            updateevents = 'TextChanged, TextChangedI',
            enable_autosnippets = true,
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = {{ '<-', 'Error' }},
                    }
                }
            }
        }

        require("luasnip.loaders.from_vscode").lazy_load()
        require('snippets/all');
    end
}
