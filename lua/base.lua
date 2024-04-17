
vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.o.termguicolors = true

vim.o.incsearch = true
vim.o.hidden = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.autoindent = true

vim.o.conceallevel = 1 -- obsidian.nvim requires it to be > 0

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

vim.o.background = "dark"

vim.o.shell = "/bin/zsh"

-------------- bootstrap Lazy.nvim --------------
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-------------- Repl-Alliance --------------

--(vim.api.nvim_create_autocmd [:FileType]
--     :group group
--     :pattern "clojure"
--     :callback (fn []  (global repl (require "srepl")
--                       (repl:connect))






