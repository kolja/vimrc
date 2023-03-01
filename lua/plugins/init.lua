
return {

    'kyazdani42/nvim-web-devicons',
    {
        'NvChad/nvim-colorizer.lua',
        version = '*',
        config = true
    },
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = true
    },
    {
        'j-hui/fidget.nvim',
        ft = {'lua', 'rust', 'cs'},
        config = true
    },
    {
        'saecki/crates.nvim',
        ft = 'rust',
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
        cmd = 'Telescope',
        version = '*',
        dependencies = {{'nvim-lua/plenary.nvim'}}
    },

    {
        "kylechui/nvim-surround",
        config = true
    },

    {
        "ggandor/leap.nvim",
        dependencies = "tpope/vim-repeat",
        keys = {'S','s'},
        config = function ()
            require('leap').add_default_mappings()
            vim.keymap.del('x', 'x') -- I want to keep 'x' for deleting stuff in visual mode
        end
    },
    -- ColorScheme

    {'mhartington/oceanic-next', lazy = true},
    {'fenetikm/falcon', lazy = true},
    {'folke/tokyonight.nvim', lazy = true},
}
