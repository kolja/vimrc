
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
        'saecki/crates.nvim',
        requires = { 'nvim-lua/plenary.nvim',
                     'jose-elias-alvarez/null-ls.nvim' },
        config = function()
            require('crates').setup()
        end,
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
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use({
        "kylechui/nvim-surround",
        tag = "*",
        config = function() require("nvim-surround").setup({}) end
    })

    -- use {
    --     'stevearc/dressing.nvim',
    --     config = function() require('dressing').setup() end
    -- }

    -- LSP ---
    -- LSP Support
    use {
        'williamboman/mason.nvim',
        config = function() require('mason').setup() end
    }
    use {'williamboman/mason-lspconfig.nvim'}
    use {'neovim/nvim-lspconfig'}

    -- LSP Autocompletion
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-nvim-lua'}
    -- use {'doxnit/cmp-luasnip-choice',
    --     config = function() require('cmp_luasnip_choice').setup({}) end
    -- }
    use {'onsails/lspkind.nvim'}

    -- LSP Snippets
    use {'L3MON4D3/LuaSnip'}
    use {'rafamadriz/friendly-snippets'}
    -- use({
    --     "glepnir/lspsaga.nvim",
    --     branch = "main",
    --     config = function()
    --         require("lspsaga").init_lsp_saga({
    --             -- error_sign = '', -- 
    --             -- warn_sign = '',
    --             -- hint_sign = '',
    --             info_sign = '',
    --         })
    --     end,
    -- })
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    }

    -- ColorScheme
    use 'mhartington/oceanic-next'
    use 'fenetikm/falcon'
    use 'folke/tokyonight.nvim'
end)
