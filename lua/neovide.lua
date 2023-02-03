
vim.g.neovide_scale_factor = 1.0
function ChangeScaleFactor(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.keymap.set('n', '<C-=>', function () ChangeScaleFactor(1.25) end)
vim.keymap.set('n', '<C-->', function () ChangeScaleFactor(1/1.25) end)

