
-- initialize packer and plugins
require('plug.packer')
require('plugins')

-- base settings for vim
require('base')

-- keymappings
require('mappings')

-- setup various plugins
require('plug.lsp')
require('plug.lualine')
require('plug.nnn')
require('plug.treesitter')
require('plug.textobjects')
require('plug.trouble')
