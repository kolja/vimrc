(module plugins {require {nvim aniseed.nvim
                          aniseed-env aniseed.env
                          packer packer}})

(packer.startup (fn []
  ;; Packer can manage itself
  (use "wbthomason/packer.nvim")

  ;; Fennel support
  (use "Olical/aniseed")
  ;;(use {1 "Olical/aniseed" :config (fn [] (aniseed-env.init))})

  (use_rocks "lua-xmlreader") ;; for my Telescope-opds

  (use "bakpakin/fennel.vim")
  (use "Olical/conjure")

  (use "tpope/vim-sexp-mappings-for-regular-people.git")
  (use "guns/vim-sexp")
  
  (use "famiu/nvim-reload")

  (use "mhinz/vim-startify")
  (use "akinsho/nvim-bufferline.lua")
  (use "famiu/feline.nvim")
  (use "norcalli/nvim-colorizer.lua")

  (use "mcchrish/nnn.vim")

  (use "iCyMind/NeoSolarized")
  (use "flazz/vim-colorschemes")

  (use "vimwiki/vimwiki")
  (use "kdheepak/lazygit.nvim")

  (use "tpope/vim-surround")
  (use "tpope/vim-repeat")
  (use "michaeljsmith/vim-indent-object")
  (use "lewis6991/gitsigns.nvim")

  (use "sirver/ultisnips")
  ;; (use "L3MON4D3/LuaSnip") ;; check out
  (use "godlygeek/tabular")
  (use "windwp/nvim-autopairs")

  (use "neovim/nvim-lspconfig")
  (use {1 "nvim-treesitter/nvim-treesitter" :run :TSUpdate})
  (use "hrsh7th/nvim-compe")
  (use "ray-x/lsp_signature.nvim")
  (use "kabouzeid/nvim-lspinstall")

  ;; C# support
  (use "dense-analysis/ale")

  ;; TeX support
  (use "lervag/vimtex")

  (use {1 "neomake/neomake" :run "npm install -g npm-which"})

  (use {
    1 "nvim-telescope/telescope.nvim"
    :requires [["nvim-lua/popup.nvim"]
               ["nvim-lua/plenary.nvim"]
               {1 "nvim-telescope/telescope-fzf-native.nvim" :run "make"}]
  })

  (use "kyazdani42/nvim-web-devicons")
)
  :config {
     :git {:clone_timeout 30}
  }
)

;; Haskell support
;; (use "neovimhaskell/haskell-vim")
;; (use "Twinside/vim-haskellConceal")
;;
;; Elm support
;; (use "lambdatoast/elm.vim")
;;
;; Julia support
;; (use "JuliaEditorSupport/julia-vim")
