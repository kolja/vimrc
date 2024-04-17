
local wk = require('which-key')
wk.register({
  ["<leader>t"] = {
    name = "Telescope",   -- optional group name
    t = { function()
      local oil = require('oil')
      oil.open()

      vim.defer_fn(function()
        oil.select({ preview = true, split = 'botright' })
      end, 50)
    end, "Open Oil" },
    f = { "<cmd>Telescope git_files<cr>", "Find Files (git)" },
    g = { "<cmd>Telescope live_grep<cr>", "Grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    p = { "<cmd>Telescope builtin<cr>", "Builtins" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    s = { "<cmd>Telescope search_history<cr>", "Search History" },
    z = { "<cmd>Telescope spell_suggest<cr>", "Spell Suggest" },
    o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    n = { "<cmd>Oil ~/Documents/notes<cr>", "Oil Notes" },
    l = { "<cmd>Telescope lsp_document_symbols<cr>", "LSP Document Symbols" },
    L = { "<cmd>Telescope lsp_workspace_symbols<cr>", "LSP Workspace Symbols" },
    d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "LSP Document Diagnostics" },
    D = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "LSP Workspace Diagnostics" },
    a = { "<cmd>Telescope lsp_code_actions<cr>", "LSP Code Actions" },
    A = { "<cmd>Telescope lsp_range_code_actions<cr>", "LSP Range Code Actions" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  },
  ["<leader>n"] = {
    name = "Notes", -- optional group name
    N = { "<cmd>Notes<cr>", "Open Notes" },
    n = { "<cmd>Oil ~/Documents/notes/inbox<cr>", "Notes inbox" },
    a = { "<cmd>ObsidianNew<cr>", "add Note" },
    s = { "<cmd>ObsidianSearch<cr>", "Grep Notes" },
    r = { "<cmd>ObsidianRename<cr>", "Rename Note" },
    l = { "<cmd>ObsidianLinks<cr>", "Links" },
    e = { "<cmd>ObsidianExtractNote<cr>", "Extract and Link" },
    w = { "<cmd>ObsidianWorkspace<cr>", "change Vault" },
    o = { "<cmd>ObsidianOpen<cr>", "Open Obsidian" },
  },
})

vim.keymap.set('n', '<leader>L', function() vim.o.list = not vim.o.list end,
  { desc = 'toggle list chars' })

-- vim.keymap.set('n', '<leader>L', ':5TermExec cmd=\'lg\' direction=float<cr>')

vim.keymap.set('n', '<leader>T', function() print(os.date '%H:%M') end,
  { desc = 'show time in statusline' })

vim.keymap.set('n', '<leader>n', function() vim.o.number = not vim.o.number end,
  { desc = 'toggle line numbers' })

vim.keymap.set('n', '<leader>l', function()
    -- vim.cmd(":messages clear")
    -- package.loaded['loriini.nvim'] = nil
    require('loriini').pick()
  end,
  { desc = 'run loriini' })

-- Teej Plugin dev helpers

P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(module)
  return require('plenary.reload').reload_module(module)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

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
  { desc = 'Vimrc' }
)
vim.keymap.set('n', '<leader>V', ':Vimrc<cr>', { silent = true, desc = 'Vimrc' })

-------------- Pick Colorscheme -----------
vim.keymap.set('n', '<leader>c', function()
    local finders = require('telescope.finders')
    require('telescope.builtin').colorscheme({
      prompt_title = 'pick colorscheme',
      layout_config = {
        width = 0.3,
        height = 10
      },

      -- finder = require('telescope.finders').new_table {
      --   "edge", "oceanicnext", "zephyr", "tokyonight"
      -- }
      opts = {
        finder = finders.new_table {
          "edge", "oceanicNext", "zephyr", "tokyonight"
        }
      }
    })
  end,
  { desc = 'pick colorscheme' }
)

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

-------------- Open Remind -----------
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

vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, { desc = 'open diagnostics', silent = true })
vim.keymap.set('n', '<leader>e', ':ToggleDiagnostics<cr>', { desc = 'toggle diagnostics', silent = true })

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
vim.keymap.set({ 'n', 'i' }, '<F6>', '<cmd>bp<cr>')
vim.keymap.set({ 'n', 'i' }, '<F9>', '<cmd>bn<cr>')

vim.keymap.set('t', '<F6>', '<C-\\><C-n>:bp<CR>')
vim.keymap.set('t', '<F9>', '<C-\\><C-n>:bn<CR>')
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

-- create split windows intuitively (Colemak style)
-- vim.keymap.set('n', '<C-m>', ':set nosplitright<bar>:vnew<cr>')
vim.keymap.set('n', '<C-n>', ':set splitbelow<bar>:new<cr>')
vim.keymap.set('n', '<C-e>', ':set nosplitbelow<bar>:new<cr>')
vim.keymap.set('n', '<C-i>', ':set splitright<bar>:vnew<cr>')

-- vim.keymap.set('n', '<C-H>', ':set nosplitright<bar>:vnew<cr>')

-- smoothly move beteen windows
vim.keymap.set('n', '<C-left>', '<C-W>h')
vim.keymap.set('n', '<C-down>', '<C-W>j')
vim.keymap.set('n', '<C-up>', '<C-W>k')
vim.keymap.set('n', '<C-right>', '<C-W>l')

vim.keymap.set('t', '<C-m>', '<C-\\><C-n><C-W>h')
vim.keymap.set('t', '<C-n>', '<C-\\><C-n><C-W>j')
vim.keymap.set('t', '<C-e>', '<C-\\><C-n><C-W>k')
vim.keymap.set('t', '<C-i>', '<C-\\><C-n><C-W>l')

-- Save and run on the commandline
-- vim.keymap.set( 'n', '<leader>r', ':w<cr> <bar> :!%:p<cr>')


vim.keymap.set('n', '<leader>G', ':lua require\'gitsigns\'.toggle_signs()<cr>', { desc = 'toggle git signs' })

-- TODO: vim.keymap.set( 'n', '<leader>z', misc.toggle-zen-mode)

vim.keymap.set('n', 'n', 'nzz')
-- vim.keymap.set('n', 'N', 'Nzz') -- use capital N for notes instead

-- toggle colorscheme (from vimrc-base)
-- TODO: vim.keymap.set( 'n', '<leader>c', misc.toggle-light-dark)

-- visual Block mode
vim.keymap.set('n', '<leader>v', 'v<C-v>', { desc = 'visual block mode' })

vim.keymap.set('n', '<leader>q', ':bd<cr>', { desc = 'close buffer' })

-- search and replace
vim.keymap.set('n', '<leader>s', ':%s/\\v', { desc = 'search and replace' })
vim.keymap.set('v', '<leader>s', ':s/\\v', { desc = 'search and replace' })

-- TODO: vim.keymap.set( 'n', '<leader>S', starter.open {silent = true})

-- move blocks of text in visual mode
vim.keymap.set('v', '-', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', '+', ':m \'<-2<CR>gv=gv')

-- leader-d to remove a selection -- somehow reminds me of cmd-d in Photoshop
vim.keymap.set('n', '<leader>d', ':nohlsearch<cr>:echom \'\'<cr>', { desc = 'hide selection',silent = true })

-- make A and I work in visual mode as they do in visual block mode
vim.keymap.set('v', '<C-q>', '<esc>\'<<C-q>\'>$')

-- always use 'very magic' regexes
vim.keymap.set('n', '/', '/\\v')

vim.keymap.set('n', '<leader>x', function()
  local current_line = vim.api.nvim_get_current_line()
  local new_line = string.gsub(current_line, "%- %[(.)%]",
    function(check)
      return check == ' ' and "- [x]" or "- [ ]"
    end)
  vim.api.nvim_set_current_line(new_line)
end, { desc = 'toggle checkboxes' })

-- remove whitespace from line endings, preserver cursor posistion
-- TODO: vim.keymap.set( 'n', :<leader><space>, [[:call Preserve('%s/\s\+$//e')<cr>]])
