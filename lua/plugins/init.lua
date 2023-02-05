
return {

    "kyazdani42/nvim-web-devicons",
    'NvChad/nvim-colorizer.lua',

    -- {"echasnovski/mini.nvim", branch = "stable" }

    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = true
    },
    {
        'j-hui/fidget.nvim',
        config = true
    },
    {
        'saecki/crates.nvim',
        dependencies = { 'nvim-lua/plenary.nvim',
                     'jose-elias-alvarez/null-ls.nvim' },
        config = true
    },
    {
        'numToStr/Comment.nvim',
        config = true
    },

    {
        'lewis6991/gitsigns.nvim',
        config = true
    },
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {{'nvim-lua/plenary.nvim'}}
    },

    {
        "kylechui/nvim-surround",
        config = true
    },

    -- use {
    --     'stevearc/dressing.nvim',
    --     config = function() require('dressing').setup() end
    -- }

    -- LSP ---
    -- LSP Support
    {
        'williamboman/mason.nvim',
        config = true
    },
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    -- LSP Autocompletion
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',

    -- {'doxnit/cmp-luasnip-choice',
    --     config = true
    -- }

    'onsails/lspkind.nvim',

    -- LSP Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    -- {
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
    -- },

    -- TODO: Checkout lsp_signature
    -- 'ray-x/lsp_signature.nvim',

    -- ColorScheme

    {'mhartington/oceanic-next', lazy = true},
    {'fenetikm/falcon', lazy = true},
    {'folke/tokyonight.nvim', lazy = true},
}
