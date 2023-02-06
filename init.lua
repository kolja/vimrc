
-- base settings for vim
require('base')

-- initialize packer and plugins
require('lazy').setup('plugins')

-- keymappings
require('mappings')

require('colorscheme')

-- neovide specific
require('neovide')
