
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
      "clojure",
      "fennel",
      "javascript",
      "typescript",
      "css",
      "c_sharp",
      "lua",
      "rust"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
