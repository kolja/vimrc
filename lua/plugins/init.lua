return {

  'kyazdani42/nvim-web-devicons',
  'nanotee/zoxide.vim',
  {
    'NvChad/nvim-colorizer.lua',
    version = '*',
    config = true
  },
  {
    'akinsho/bufferline.nvim',
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
    'lewis6991/gitsigns.nvim',
    config = true
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    version = '*',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('telescope').setup({
        pickers = {
          colorscheme = {
            theme = "dropdown",
            prompt_title = false,
            enable_preview = true,
            results_title = false,
            layout_config = {
              width = 0.25,
              height = 0.5,
            },

          },
        },
      })
    end
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
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },
  {
    "Olical/conjure"
  },
  {
    "julienvincent/nvim-paredit",
    config = true
  },
  { 'github/copilot.vim' }, -- zbirenbaurm/copilot.vim what about it?
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = true,
    }
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true
  },
  {
    'kolja/loriini.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('loriini').setup({
        bin = "/opt/homebrew/bin/loriini",
      })
    end
  }

}
