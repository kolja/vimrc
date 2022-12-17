
return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'luukvbaal/nnn.nvim'

    use 'NvChad/nvim-colorizer.lua'
    --      use {"echasnovski/mini.nvim" branch "stable" }
    use {
        'akinsho/bufferline.nvim', 
        tag = "v3.*", 
        requires = 'nvim-tree/nvim-web-devicons',
        config = function() require("bufferline").setup{} end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup({}) end
    }

    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use 'nvim-treesitter/nvim-treesitter'

    use {
        'stevearc/dressing.nvim',
        config = function() require('dressing').setup() end
    }


    -- LSP
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }
    -- ColorScheme
    use 'mhartington/oceanic-next'
    use 'fenetikm/falcon'
    use 'folke/tokyonight.nvim'
end)
