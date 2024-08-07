
local group = vim.api.nvim_create_augroup("the_group", {clear = false})

-- Remove Spaces from the end of lines when saving
-- vim.api.nvim_create_autocmd("BufWritePre, FileWritePre", {
--     group = group,
--     callback = function()
--         local r,c = unpack(vim.api.nvim_win_get_cursor(0))
--         vim.cmd('%s/\\v\\s+$//e') -- e-flag suppresses error if no spaces found
--         vim.api.nvim_win_set_cursor( 0, { r, c })
--     end
-- })

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "OilEnter",
--   callback = vim.schedule_wrap(function(args)
--     local oil = require("oil")
--     local util = require("oil.util")
--     if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
--       local id = util.get_preview_win()
--       if id then
--         vim.api.nvim_win_close(id, true)
--         return
--       end
--       oil.open_preview({split = 'botright'})
--     end
--   end),
-- })

-- Highlight on Yank
vim.api.nvim_create_autocmd( "TextYankPost", {
    group = group,
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 300
        })
    end
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "uss",
    command = "set ft=css"
})

-- remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})
