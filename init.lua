
-- base settings for vim
require('base')

-- initialize packer and plugins
require('lazy').setup('plugins')

require('mappings')
require('autocommand')
require('colorscheme')

-- neovide specific
require('neovide')
