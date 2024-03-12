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
        ft = { 'lua', 'rust', 'cs' },
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
        'karb94/neoscroll.nvim',
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
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    {
        "kylechui/nvim-surround",
        config = true
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    {
        "ggandor/leap.nvim",
        dependencies = "tpope/vim-repeat",
        keys = { 'S', 's' },
        config = function()
            require('leap').add_default_mappings()
            vim.keymap.del('x', 'x') -- I want to keep 'x' for deleting stuff in visual mode
        end
    },
    -- {
    --   'mhartington/formatter.nvim',
    --   config = function()
    --     local formatter_prettier = { require('formatter.defaults.prettier') }
    --     require("formatter").setup({
    --       filetype = {
    --         javascript      = formatter_prettier,
    --         javascriptreact = formatter_prettier,
    --         typescript      = formatter_prettier,
    --         typescriptreact = formatter_prettier,
    --       }
    --     })
    --     -- automatically format buffer before writing to disk:
    --     vim.api.nvim_create_augroup('BufWritePreFormatter', {})
    --     vim.api.nvim_create_autocmd('BufWritePre', {
    --       command = 'FormatWrite',
    --       group = 'BufWritePreFormatter',
    --       pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
    --     })
    --   end,
    --   ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    -- },
    {
        "Olical/conjure"
    },
    {
        "julienvincent/nvim-paredit",
        config = true
    },
    -- {
    --   "guns/vim-sexp",
    -- },
    -- {
    --   "tpope/vim-repeat"
    -- },
    -- {
    --   "tpope/vim-sexp-mappings-for-regular-people",
    -- },

    -- ColorScheme
  -- {
  --   "kelly-lin/ranger.nvim",
  --   config = function()
  --     require("ranger-nvim").setup({ replace_netrw = true })
  --     vim.api.nvim_set_keymap("n", "tt", "", {
  --       noremap = true,
  --       callback = function()
  --         require("ranger-nvim").open(true)
  --       end,
  --     })
  --   end,
  -- }, 
  {
    'theniceboy/joshuto.nvim',
  },
    { 'github/copilot.vim' },
    { 'mhartington/oceanic-next', lazy = true },
    { 'fenetikm/falcon',          lazy = true },
    { 'folke/tokyonight.nvim',    lazy = true },

}
