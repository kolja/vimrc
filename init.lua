
-- base settings for vim
require('base')

-- initialize packer and plugins
require('lazy').setup('plugins', {
  dev = {
    path = '~/dev/local/'
  }
})

require('mappings')
require('autocommand')
-- require('colorscheme')

-- neovide specific
require('neovide')
