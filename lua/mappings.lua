-- (module mappings
--  {require {a aniseed.core
--            nvim aniseed.nvim
--            telescope telescope
--            ls luasnip
--            nu aniseed.nvim.util
--            pt plug.telescope
--            misc plug.misc
--            starter mini.starter
--            }})

vim.keymap.set('n', '<leader>l', function() vim.o.list = not vim.o.list end,
    { desc = 'toggle list chars' })

vim.keymap.set('n', '<leader>L', ':5TermExec cmd=\'lg\' direction=float<cr>')

vim.keymap.set('n', '<leader>t', function() print(os.date '%H:%M') end,
    { desc = 'show time in statusline' })

vim.keymap.set('n', '<leader>n', function() vim.o.number = not vim.o.number end,
    { desc = 'toggle line numbers' })

-------------- Open Vimrc -----------
vim.api.nvim_create_user_command('Vimrc',
    function()
        require('telescope.builtin').find_files({
                                                  -- file_browser, live_grep, git_files
            prompt_title = 'Vimrc Config',
            file_ignore_patterns = { '*.pdf', '*.tex' },
            cwd = '~/.config/nvim/'
        })
    end,
    { desc = 'open Vimrc Files' }
)
vim.keymap.set('n', '<leader>V', ':Vimrc<cr>' ,{ silent = true, desc = 'toggle line numbers' })

-------------- Open Notes -----------
vim.api.nvim_create_user_command('Notes',
    function()
        require('telescope.builtin').find_files({
            prompt_title = 'open notes',
            cwd = '~/Documents/notes/'
        })
    end,
    { desc = 'open notes' }
)

-------------- Open Notes -----------
vim.api.nvim_create_user_command('Rem',
    function()
        require('telescope.builtin').find_files({
            prompt_title = 'Remind',
            cwd = '~/Documents/notes/remind/'
        })
    end,
    { desc = 'open remind config' }
)
-------------- Toggle Diagnostics -----------

vim.g.show_diagnosics = true

vim.api.nvim_create_user_command('ToggleDiagnostics',
    function()
        vim.g.show_diagnostics = not vim.g.show_diagnostics
        vim.diagnostic.config({
            signs = vim.g.show_diagnostics,
            underline = vim.g.show_diagnostics,
            virtual_text = vim.g.show_diagnostics
        })
    end,
    { desc = 'toggle lsp diagnostic messages' }
)

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { silent = true })
vim.keymap.set('n', '<leader>E', ':ToggleDiagnostics<cr>', { silent = true })

-- (defn browse-opds [port]
--   ((. telescope :extensions :opds :browse)
--      {:url (.. 'http://synology:' port '/feed.php')
--       :raw_preview false
--       :open_fn (fn [media]
--                   (print (vim.inspect media)))}))

--(vim.api.nvim_create_user_command :Opds #(browse-opds '49194')
--                                  {'desc', 'Browse Opds Server: Fiction'})

--(vim.api.nvim_create_user_command :OpdsNonfiction #(browse-opds '49196')
--                                  {'desc', 'Browse Opds Server: Nonfiction'})

-- navigate wrapped lines
vim.keymap.set('n', 'j', 'gj', { desc = 'navigate wrapped lines the same way you navigate non-wrapped lines' })
vim.keymap.set('n', 'k', 'gk', { desc = 'navigate wrapped lines the same way you navigate non-wrapped lines' })

-- map <option>l to λ
vim.keymap.set('i', '¬', '<C-K>*l')

-- navigate buffers: cmd-shift-l = ƒ  cmd-shift-h = ∂
vim.keymap.set({ 'n', 'i' }, '<F9>', '<cmd>bn<cr>')
vim.keymap.set({ 'n', 'i' }, '<F7>', '<cmd>bp<cr>')
-- vim.keymap.set( 'i', 'ƒ', '<esc><cmd>bn<cr>')
-- vim.keymap.set( 'i', '∂', '<esc><cmd>bp<cr>')

vim.keymap.set('t', 'ƒ', '<C-\\><C-n>:bn<CR>')
vim.keymap.set('t', '∂', '<C-\\><C-n>:bp<CR>')
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

-- create split windows intuitively
vim.keymap.set('n', '<C-right>', ':set splitright<bar>:vnew<cr>')
vim.keymap.set('n', '<C-left>', ':set nosplitright<bar>:vnew<cr>')
vim.keymap.set('n', '<C-up>', ':set nosplitbelow<bar>:new<cr>')
vim.keymap.set('n', '<C-down>', ':set splitbelow<bar>:new<cr>')

-- smoothly move beteen windows
vim.keymap.set('n', '<C-j>', '<C-W>j')
vim.keymap.set('n', '<C-k>', '<C-W>k')
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-l>', '<C-W>l')

vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-W>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-W>k')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-W>h')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-W>l')

-- Save and run on the commandline
-- vim.keymap.set( 'n', '<leader>r', ':w<cr> <bar> :!%:p<cr>')

vim.keymap.set('n', '<leader>f', ':Telescope git_files<cr>')
vim.keymap.set('n', '<leader>g', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>p', ':Telescope builtin<cr>')

vim.keymap.set('n', '<leader>G', ':lua require\'gitsigns\'.toggle_signs()<cr>')
vim.keymap.set('n', 'tt', ':NnnPicker<cr>')

-- TODO: vim.keymap.set( 'n', '<leader>z', misc.toggle-zen-mode)

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- toggle colorscheme (from vimrc-base)
-- TODO: vim.keymap.set( 'n', '<leader>c', misc.toggle-light-dark)

-- visual Block mode
vim.keymap.set('n', '<leader>v', 'v<C-v>')

vim.keymap.set('n', '<leader>q', ':bd<cr>')

-- search and replace
vim.keymap.set('n', '<leader>s', ':%s/\\v')
vim.keymap.set('v', '<leader>s', ':s/\\v')

-- TODO: vim.keymap.set( 'n', '<leader>S', starter.open {silent = true})

-- move blocks of text in visual mode
vim.keymap.set('v', '<down>', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', '<up>', ':m \'<-2<CR>gv=gv')

-- leader-d to remove a selection -- somehow reminds me of cmd-d in Photoshop
vim.keymap.set('n', '<leader>d', ':nohlsearch<cr>:echom \'\'<cr>', { silent = true })

-- make A and I work in visual mode as they do in visual block mode
vim.keymap.set('v', '<C-q>', '<esc>\'<<C-q>\'>$')

-- always use 'very magic' regexes
vim.keymap.set('n', '/', '/\\v')


vim.keymap.set('n', 'T', function()
    require("FTerm").scratch(
        {
            cmd = { '/Users/kolja/dev/loriini/target/debug/loriini', '-s', '18', '-r', '9' },
            dimensions = {
                height = 0.40,
                width = 0.30,
                x = 0.5,
                y = 0.5
            },
            -- blend = 20,
            on_exit = function()
                require("FTerm").exit()
            end,
            border = 'none', -- none, double, rounded, shadow
        })
end)

vim.keymap.set('n', '<leader>x', function()
    local toggle = { '- [ ]', '- [x]' }
    local i = 1
    vim.api.nvim_substitute({
        range = { vim.api.nvim_win_get_cursor(0)[1] - 1, vim.api.nvim_win_get_cursor(0)[1] },
        pattern = '- [ ]',
        replacement = toggle[i],
        flags = 'c'
    })
end)
-- remove whitespace from line endings, preserver cursor posistion
-- TODO: vim.keymap.set( 'n', :<leader><space>, [[:call Preserve('%s/\s\+$//e')<cr>]])
