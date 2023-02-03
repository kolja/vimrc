
vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.o.termguicolors = true

vim.o.incsearch = true
vim.o.hidden = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.autoindent = true

vim.o.pumblend = 20 -- make pop-up-menu transparent

vim.o.colorcolumn = "81" -- reminder when line gets too long

vim.o.enc = "utf-8"
vim.o.scroll = 5
vim.o.scrolloff = 7

-- don't use swapfiles. Use git instead
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.hlsearch = true

-- allways use OSX's clipboard
vim.o.clipboard = "unnamed"

-- Sets how many lines of history VIM has to remember
vim.o.history = 1000
vim.o.foldenable = false

-- show linenumbers
vim.o.number = true

-- highlight tabs and trailing spaces
vim.opt.listchars = { tab = '››', eol = '¬', trail = '·' }
vim.o.list = false

-- Set to auto read when a file is changed from the outside
vim.o.autoread = true

vim.o.inccommand = "nosplit"

vim.o.lazyredraw = false

vim.o.showmode = false

vim.o.laststatus = 3

-- vim.o.guifont = "FiraCode-Regular:h11"
vim.o.background = "dark"
vim.cmd('syntax on')

--vim.cmd('colorscheme falcon')
vim.cmd('colorscheme OceanicNext')
--vim.cmd('colorscheme tokyonight-storm') -- night, moon, storm, day


-- ------ Autocommands ----------
-- ------ :help lua-autocmd -----

local group = vim.api.nvim_create_augroup("the_group", {clear = false})

vim.api.nvim_create_autocmd( "TextYankPost", {
    group = group,
    callback = function() 
        vim.highlight.on_yank( {
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
------------- hide statusline for Startify -------------

-- (vim.api.nvim_create_autocmd [:FileType] {
--  :group group
--  :pattern "starter"
--  :callback (fn [] nvim.o.laststatus 0))}

-- (vim.api.nvim_create_autocmd [:BufEnter] {
--  :group group
--  :callback (fn [] nvim.o.laststatus 3))}

-------------- Repl-Alliance --------------

--(vim.api.nvim_create_autocmd [:FileType]
--     :group group
--     :pattern "clojure"
--     :callback (fn []  (global repl (require "srepl")
--                       (repl:connect))


