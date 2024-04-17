return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                "clojure",
                "python",
                "markdown",
                "markdown_inline",
                "fennel",
                "javascript",
                "typescript",
                "vue",
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
            indent = { enable = true }
        }
    end
}
