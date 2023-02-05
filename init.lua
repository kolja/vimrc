
-- base settings for vim
require('base')

-- initialize packer and plugins
require('lazy').setup('plugins')

-- keymappings
require('mappings')

-- plugin setup
require('plug.lsp')

require('colorscheme')

-- neovide specific
require('neovide')
