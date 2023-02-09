return {
    'numToStr/FTerm.nvim',
    config = function ()
        vim.keymap.set('n', 'L', function ()
            require("FTerm").scratch({cmd = {'lazygit'}})
        end)
    end
}
